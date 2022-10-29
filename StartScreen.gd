extends Control


var bg_scroll_velocity = Vector2(1000,0) #1000

onready var title_label = $Home/MarginContainer/Title
onready var settings_label = $Settings/MarginContainer/Settings
onready var credits_label = $Credits/MarginContainer/Credits

onready var bg = $ParallaxBackground

onready var camera = $Camera2D

onready var tween = $Tween

var show_settings = false

func _ready():
	title_label.rect_pivot_offset.x = title_label.rect_size.x / 2
	title_label.rect_pivot_offset.y = title_label.rect_size.y / 2
	
	settings_label.rect_pivot_offset.x = settings_label.rect_size.x / 2
	credits_label.rect_pivot_offset.x = settings_label.rect_size.x / 2
	



func _process(delta):
	# background always has scroll speed
	#var new_offset: Vector2 = bg.get_scroll_offset() + bg_scroll_velocity + camera.offset * delta
	#bg.set_scroll_offset(new_offset)
	
	#bg.scroll_offset.x += delta * speed
	
	# make title jump around
	title_label.rect_scale.x = .83 + .17 * sin($SinTimer.time_left)
	title_label.rect_rotation = 5 * cos($SinTimer.time_left)
	
	# spin settings around
	settings_label.rect_scale.x = sin($SinTimer.time_left)
	
	# spin credits around
	credits_label.rect_scale.x = sin($SinTimer.time_left)

	
# start game when start button pressed
func _on_TextureButton_pressed():
	get_tree().change_scene("res://Main.tscn")


func _on_Settings_pressed():
	tween.interpolate_property(camera,"position",Vector2(512,304),
	Vector2(3512,304),1.5,Tween.TRANS_EXPO, 
	Tween.EASE_IN_OUT)
	
	tween.start()

# whenever any exit pressed, return to main screen
func _on_Exit_pressed():
	tween.interpolate_property(camera,"position",camera.position,
	Vector2(512,304),1.5,Tween.TRANS_EXPO, 
	Tween.EASE_IN_OUT)
	
	tween.start()


func _on_Credits_pressed():
	tween.interpolate_property(camera,"position",Vector2(512,304),
	Vector2(-2488,304),1.5,Tween.TRANS_EXPO, 
	Tween.EASE_IN_OUT)
	
	tween.start()
