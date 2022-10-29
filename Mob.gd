#MOB REQUIRES a PLAYER and a MAP in order to work

extends KinematicBody2D


var gravity = 1500 #1500
var speed = 350
var acc_slow = 0.05
var velocity = Vector2.ZERO
var jump_speed = -800
var lung_speed = 900

var follow_range_max = 1400
var follow_range_min = 20
var range_to_jump = 105

var d_2_p #distance to player

var player
var map

var map_found = false
var player_found = false

var rng = RandomNumberGenerator.new()

var interested = false

var attack_cooldown_time = 1.5
var attack_cooldown_time_left
var attacking = false

var last_facing = ""

#delete these vars
var test_dist

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	# make sure theres a player then get player
	if get_tree().get_nodes_in_group("players"):
		player = get_tree().get_nodes_in_group("players")[0]
		player_found = true
	else:
		print(str(self.name) + " No player found")
	if get_tree().get_nodes_in_group("maps"):
		map = get_tree().get_nodes_in_group("maps")[0]
		map_found = true
	else:
		print(str(self.name) + " No map found")



func _physics_process(delta):
	attack_cooldown_time_left = $AttackCooldown.time_left
	
	d_2_p = position.distance_to(player.position)
	
	# apply gravity
	velocity.y += gravity * delta
	
	if player_found:
		# check if near player

		if d_2_p < follow_range_max:
			agro()
		else:
			idle()
	
	# apply velocity
	velocity.x = lerp(velocity.x,0,acc_slow)
	velocity = move_and_slide(velocity, Vector2.UP)
	
	# update last facing
	if velocity.x > 0:
		last_facing = "right"
	if velocity.x < 0:
		last_facing = "left"
		
	
	
	# attack player if nearby
	if d_2_p < follow_range_min:
		attack_player()
		acc_slow = rng.randf_range(0.6,0.95)
	else:
		acc_slow = 0.05
		attacking = false

	
	# change attack collision towards facing
	#if velocity.x > 0:
	#	$AttackCollision/CollisionShape2D.rotation_degrees = -90

	#if velocity.x < 0:
	#	$AttackCollision/CollisionShape2D.rotation_degrees = 90

	
func _on_JumpTimer_timeout():
	if player_found:
		if is_on_floor() && interested == true:
			if d_2_p > range_to_jump:
				velocity.y = jump_speed
		$JumpTimer.start(rng.randf_range(.5,2))
	
# when idling
func idle():
	$AnimatedSprite.modulate = Color(.9, 1, .9)
	$AnimatedSprite.play("stand")
	velocity.x = 0
	interested = false

# when aggressive
func agro():
	var velocity_towards_player = position.direction_to(player.position) * speed
	
	if d_2_p > follow_range_min:
		velocity.x = velocity_towards_player.x
	
	#play other animations if not attacking
	if attacking == false:
		if velocity.x > 0 && is_on_floor():
			$AnimatedSprite.play("walk_right")
		elif velocity.x < 0 && is_on_floor(): 
			$AnimatedSprite.play("walk_left")
		if velocity.x == 0 && is_on_floor():
			$AnimatedSprite.play("stand")
		if velocity.x > 0 && !is_on_floor():
			$AnimatedSprite.play("jump_right")
		elif velocity.x < 0 && !is_on_floor():
			$AnimatedSprite.play("jump_left")
		if velocity.x == 0 && !is_on_floor():
			$AnimatedSprite.play("jump_up")
	interested = true
	$AnimatedSprite.modulate = Color(.9, 0, .51)

func attack_player():
	if $AttackCooldown.time_left == 0:
		$AttackCooldown.start(attack_cooldown_time)
		player.attacked = true
	attacking = true
	if is_on_floor():
		if last_facing == "right":
			$AnimatedSprite.play("attack_right")
		if last_facing == "left":
			$AnimatedSprite.play("attack_left")
	else:
		$AnimatedSprite.play("attack_down")
