extends CanvasLayer

export (PackedScene) var Heart

var map
var player
var block_size

var heart_amount = 0

# inventory time between opening/closing
var inventory_timeout = .25 #sec
onready var inventory_timer = $Inventory/InventoryTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().get_nodes_in_group("players"):
		player = get_tree().get_nodes_in_group("players")[0]

		
	if get_tree().get_nodes_in_group("maps"):
		map = get_tree().get_nodes_in_group("maps")[0]
	
	else:
		print("No player/map found")
		
	block_size = map.cell_size * map.scale



func _process(delta):
	var player_pos = Vector2(round(player.position.x/block_size.x-32),round(player.position.y/block_size.x))
	$Debugmenu/coordLabel.text = str(round(player_pos.x)) + ", " + str(round(player_pos.y*-1))
	$Debugmenu/mobCountLabel.text = "Mobcount: " + str(len(get_tree().get_nodes_in_group("mobs")))
	# update player's health if not same as heart amount
	if player.health != heart_amount:
		heart_amount = player.health
		for health_instance in $PlayerHealth.get_children():
			health_instance.queue_free()
		for health in player.health:
			var h = Heart.instance()
			$PlayerHealth.add_child(h)
	
	if Input.is_action_pressed("open_inventory"):
		if inventory_timer.time_left == 0:
			inventory_timer.start(inventory_timeout)
			if $Inventory.visible == true:
				$Inventory.hide()
			elif $Inventory.visible == false:
				$Inventory.show()
			
		
	
	# update grapple reload with grapple timer from player
	$MarginContainer/GrappleReload.value = 100- ((player.grapple_timer.time_left / player.grapple_delay) * 100)
