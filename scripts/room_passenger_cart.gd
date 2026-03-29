extends Node2D


func _on_zindex_collisions_body_entered(body: CharacterBody2D) -> void:
	body.z_index = 1


func _on_zindex_collisions_body_exited(body: CharacterBody2D) -> void:
	body.z_index = 0
