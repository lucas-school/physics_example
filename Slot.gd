extends Panel

#FIRST CHILD MUST HAVE RECT SIZE
var SnowItem = preload("res://game_assets/items/itemSnow.tscn")


var item_size = 20
var item = null

func _ready():
	if randi() % 2 == 0:
		item = SnowItem.instance()

		item.get_child(0).rect_size = Vector2(item_size,item_size)
		var item_rect = item.get_child(0).rect_size
		#print(item.get_child(0).rect_size)
		
		# center item
		item.position.x += (rect_size.x-item_rect.x)/2
		item.position.y += (rect_size.y-item_rect.y)/2
		add_child(item)

func pickFromSlot():
	remove_child(item)
	find_parent("Inventory").add_child(item)
	item = null
	
func putIntoSlot(new_item):
	item = new_item
	item.position = Vector2(0, 0)
	find_parent("Inventory").remove_child(item)
	add_child(item)
