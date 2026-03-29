extends RigidBody2D

var offset := Vector2()
var dragging := false
@onready var parent_node = $"../.."


func _process(delta: float) -> void:
	if dragging == true:
		position = (get_global_mouse_position() - offset) 


func _on_button_button_down() -> void:
	offset = get_global_mouse_position() - global_position
	dragging = true


func _on_button_button_up() -> void:
	dragging = false
	var tween = get_tree().create_tween()
	tween.tween_property($".", "rotation", 0, 0.3)\
	.set_trans(Tween.TRANS_QUAD)\
	.set_ease(Tween.EASE_OUT)
