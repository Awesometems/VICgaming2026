extends Node

enum Direction{
	LEFT,
	RIGHT
}

var currentLocation := ""
var inventory = []
var notebook = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentLocation = "res://scenes/engineering_cart.tscn"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func move(direction: Direction) -> bool:
	if Map.canMove(currentLocation, direction):
		currentLocation = Map.getNeighbor(currentLocation, direction)
		get_tree().change_scene_to_file(currentLocation)
		return true
	return false
