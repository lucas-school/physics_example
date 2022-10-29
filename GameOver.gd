extends Control


var speed = 75 #75

onready var game_over_title = $MarginContainer/GameOverTitle

# Called when the node enters the scene tree for the first time.
func _ready():
	game_over_title.rect_pivot_offset.x = game_over_title.rect_size.x / 2
	game_over_title.rect_pivot_offset.y = game_over_title.rect_size.y / 2



func _process(delta):
	$ParallaxBackground.scroll_offset.x += delta * speed
	game_over_title.rect_scale.x =   sin($SinTimer.time_left)
	game_over_title.rect_rotation = 5 * cos($SinTimer.time_left)
	


func _on_NewGame_pressed():
	get_tree().change_scene("res://Main.tscn")
