extends Control

@onready var room_name_label = $CanvasLayer/roomName


func _ready() -> void:
	room_name_label.text = Map.room_names[Player.currentLocation]
	if !Tracking.crowbar:
		$crowbar.disabled = true
		$crowbar.visible = false
	if !Tracking.key:
		$key.disabled = true
		$key.visible = false
	if !Tracking.gear:
		$gear.disabled = true
		$gear.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_right_pressed() -> void:
	Player.move(Player.Direction.RIGHT)


func _on_left_pressed() -> void:
	Player.move(Player.Direction.LEFT)
	
