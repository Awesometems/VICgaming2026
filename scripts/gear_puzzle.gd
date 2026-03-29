extends Node2D

@onready var puzzle_scene := preload("res://scenes/puzzle_piece.tscn") 
var piece_types = [
	preload("res://assets/puzzle1piece1.png"),
	preload("res://assets/puzzle1piece2.png"),
	preload("res://assets/puzzle1piece3.png"),
	preload("res://assets/puzzle1piece4.png")
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PuzzlePiece.get_child(1).texture = piece_types[0]
	$PuzzlePiece2.get_child(1).texture = piece_types[1]
	$PuzzlePiece3.get_child(1).texture = piece_types[2]
	$PuzzlePiece4.get_child(1).texture = piece_types[3]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
