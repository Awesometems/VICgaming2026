extends Node2D

var cursor = load("res://assets/interact.png")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	
