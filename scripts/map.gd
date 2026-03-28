extends Node

var map = [
	"res://scenes/engineering_cart.tscn",
	"res://scenes/passanger_cart.tscn"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func canMove(location: String, direction: int) -> bool:
	var idx = map.find(location)
	if idx == -1:
		return false
	if direction == 0:  # LEFT
		return idx - 1 >= 0
	if direction == 1:  # RIGHT
		return idx + 1 < map.size()
	return false

func getNeighbor(location: String, direction: int) -> String:
	var idx = map.find(location)
	if direction == 0:  # LEFT
		return map[idx - 1]
	if direction == 1:  # RIGHT
		return map[idx + 1]
	return location
