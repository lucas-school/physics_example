extends KinematicBody2D


var velocity = Vector2.ZERO
var screensize
const ray_length = 10000

var speed = 400  # 800 pixels/s
const acc = 20
const acc_slow = 0.05
const acc_slow_in_air = 0.01
var grapple_power = 30

var max_health = 15
var health = max_health
var dead = false
var attack_effect_time = .5

var gravity = 1500 # 1500 pix/s/s
var jump_speed = -650 #-650

var draw_list = Vector2.ZERO

onready var grapple_timer = $Timers/GrappleTimer
var grapple_length = 1000
var grapple_pos = Vector2.ZERO
var grapple_dir = Vector2.ZERO
var grapple_close_range = 100
var grapple_result
var moving_on_grapple = false
var grapple_delay = 1.2 #sec

var attacked = false

onready var damage_overlay_box = $CanvasLayer/DamageOverlay
onready var damage_overlay_timer = $Timers/DamageOverlayTimer
var damage_overlay_time = .6
var max_damage_overlay_opacity = .2
var damage_overlay_opacity = max_damage_overlay_opacity




var rng = RandomNumberGenerator.new()



#seconds fade to red
var game_over_time = 3
onready var game_over_timer = $Timers/GameOverTimer
var played_game_over = 0


func _ready():
	damage_overlay_box.rect_size = get_viewport().size
	damage_overlay_box.visible = false
	randomize()

func _physics_process(delta):
	
	# update drawings
	update()
	
	velocity.y += gravity * delta
	
	# raycasting
	var space_state = get_world_2d().direct_space_state
	
	# grappling hook
	
	# if letter q, raycast and find first collision
	if Input.is_action_pressed("grapple") && not dead:
		if grapple_timer.time_left == 0:
			var mouse_pos = get_global_mouse_position()
			var mouse_dir = get_local_mouse_position().normalized()
			
			# check to ensure result then run updated casting
			grapple_result = space_state.intersect_ray(position, position + mouse_dir * grapple_length, [self])
			if grapple_result:
				moving_on_grapple = true
				grapple_timer.start(grapple_delay)
			

	
	# player move and accel
	if Input.is_action_pressed("ui_right") && not dead:
		velocity.x = min(velocity.x + acc, speed)
		if is_on_floor() && moving_on_grapple == false:
			$AnimatedSprite.play("walk_right")
		if !is_on_floor() && moving_on_grapple == false:
			$AnimatedSprite.play("jump_right")
			
	elif Input.is_action_pressed("ui_left") && not dead:
		velocity.x = max(velocity.x - acc, -speed)
		if is_on_floor() && moving_on_grapple == false:
			$AnimatedSprite.play("walk_left")
		if !is_on_floor() && moving_on_grapple == false:
			$AnimatedSprite.play("jump_left")
	
	# change friction on jump
	elif !is_on_floor() && not dead:
		velocity.x = lerp(velocity.x,0,acc_slow_in_air)
		if velocity.x == 0:
			$AnimatedSprite.play("jump_up")
	else:
		velocity.x = lerp(velocity.x,0,acc_slow)
		$AnimatedSprite.play("stand")
	
	# grapple cancel
	if Input.is_action_pressed("grapple_cancel") && not dead:
		moving_on_grapple = false
	
	if position.distance_to(grapple_pos) > grapple_close_range && moving_on_grapple == true && grapple_result:
		draw_list = grapple_result.position
		update()
		
		grapple_pos = grapple_result.position
		var grapple_angle = position.angle_to_point(grapple_result.position)
		grapple_dir = -Vector2(cos(grapple_angle), sin(grapple_angle))
		moving_on_grapple = true
		velocity += grapple_dir * grapple_power
		$AnimatedSprite.play("grappling")
	if position.distance_to(grapple_pos) <= grapple_close_range:
		moving_on_grapple = false

		
		
	# player jump
	velocity = move_and_slide(velocity, Vector2.UP)
	if is_on_floor() && Input.is_action_just_pressed("ui_up") && not dead:
		velocity.y = jump_speed
	
	screensize = get_viewport().size
	
	if $HitTimer.time_left > 0 && not dead:
		modulate = Color(1, 0, 0)
	else:
		modulate = Color(1, 1, 1)
	
	if attacked == true && health > 0:
		$HitTimer.start(attack_effect_time)
		damage_overlay_timer.start(damage_overlay_time)
		$BloodSpatter.emitting = true
		health -= 1
		attacked = false
		
		# play random hurt effect
		var random_hurt = round(rng.randf_range(1,3))
		if random_hurt == 1:
			$Sounds/hurt1.play()
		if random_hurt == 2:
			$Sounds/hurt2.play()
		if random_hurt == 3:
			$Sounds/hurt3.play()
	if health <= 0:
		dead = true
		modulate = Color(1, 0, 0)
		
		if game_over_timer.time_left == 0:
			played_game_over += 1
			game_over_timer.start(game_over_time)

		# once played game over sequence once, go to game over screen
		if played_game_over == 2:
			get_tree().change_scene("res://GameOver.tscn")
			
		
		
	# screen flashes red when hit
	if not dead:
		if damage_overlay_timer.time_left == damage_overlay_time:
			damage_overlay_opacity = max_damage_overlay_opacity
			
		if damage_overlay_timer.time_left > 0:
			damage_overlay_box.visible = true
			damage_overlay_opacity = (damage_overlay_timer.time_left / damage_overlay_time) * max_damage_overlay_opacity
		else:
			damage_overlay_box.visible = false


	if dead: #screen fades to red when game over (must come after red hit)
		if game_over_timer.time_left == game_over_time:
			damage_overlay_opacity = 0
			
		if game_over_timer.time_left > 0:
			damage_overlay_box.visible = true
			damage_overlay_opacity = 1 - (game_over_timer.time_left / game_over_time)
		else:
			damage_overlay_box.visible = false
		
	damage_overlay_box.color = Color(1,0,0,damage_overlay_opacity)

	
	
	

# line drawing code from 
#https://godotengine.org/qa/3829/how-to-draw-a-line-in-2d
func _draw():
	if moving_on_grapple:
		draw_line(Vector2.ZERO, to_local(draw_list), Color(1.0, 1.0, 1.0, 1.0), 3)
