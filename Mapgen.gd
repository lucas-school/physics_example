extends TileMap
var noise = OpenSimplexNoise.new()

var width = 1024 #1024
var height = 1024

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	# Configure
	noise.seed = randi()
	noise.octaves = 3
	noise.period = 26.3
	noise.persistence = 0
	noise.lacunarity = 1.52
	
	for x in width:
		for y in height:
			#set snow
			if noise.get_noise_2d(x,y) >= 0.05 && noise.get_noise_2d(x,y) < 0.12:
				self.set_cell(x, y, 2)
			#set dirt
			if noise.get_noise_2d(x,y) >= 0.12 && noise.get_noise_2d(x,y) < 0.25:
				self.set_cell(x, y, 1)
			#set stone
			if noise.get_noise_2d(x,y) >= 0.25:
				self.set_cell(x, y, 0)
			
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
