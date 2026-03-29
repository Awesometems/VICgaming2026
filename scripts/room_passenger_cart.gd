extends Node2D

@onready var player_scene := preload("res://scenes/player.tscn") 
var player_instance

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
		
func _on_zindex_collisions_body_entered(body: CharacterBody2D) -> void:
	body.z_index = 1


func _on_zindex_collisions_body_exited(body: CharacterBody2D) -> void:
	body.z_index = 0
