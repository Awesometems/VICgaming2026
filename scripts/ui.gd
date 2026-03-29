extends Control

@onready var room_name_label = $CanvasLayer/roomName

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	room_name_label.text = Map.room_names[Player.currentLocation]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_right_pressed() -> void:
	Player.move(Player.Direction.RIGHT)


func _on_left_pressed() -> void:
	Player.move(Player.Direction.LEFT)
	
