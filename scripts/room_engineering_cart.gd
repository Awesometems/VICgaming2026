extends Node2D

@onready var player_scene := preload("res://scenes/player.tscn") 
var player_instance
var cursor = load("res://assets/interact.png")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_instance = player_scene.instantiate()
	$"..".add_child(player_instance)
	
	# left door just entered, spawn char in right door
	if Tracking.door_entered == 1:
		player_instance.set_position($Door.position - Vector2(40, -120))
	# right door just entered, spawn char in right door
	else:
		player_instance.set_position($Door2.position + Vector2(-40, -120))
		
	
	if !Tracking.crowbar:
		$Button.disabled = false
		$Button.visible = true



func _on_button_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(cursor)


func _on_button_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(null)


func _on_button_pressed() -> void:
	$Button.disabled = true
	$Button.visible = false
	Tracking.crowbar = 1
	
