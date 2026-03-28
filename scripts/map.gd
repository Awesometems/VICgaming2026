extends Node

var map = [
	"res://scenes/room_engine.tscn",
	"res://scenes/room_tender.tscn",
	"res://scenes/room_engineering_cart.tscn",
	"res://scenes/room_passenger_cart.tscn",
	"res://scenes/room_jungle.tscn"
	
	
]

var room_names = {
	"res://scenes/room_engineering_cart.tscn": "Engineering Cart",
	"res://scenes/room_passenger_cart.tscn": "Passenger Cart",
	"res://scenes/room_tender.tscn": "Tender",
	"res://scenes/room_engine.tscn": "The Engine",
	"res://scenes/room_jungle.tscn": "The Garden"
	
}

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
