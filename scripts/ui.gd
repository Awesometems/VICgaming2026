extends Control
@onready var label: CanvasLayer = $"../Textbox"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.queue_text("[wave]Make sure to get the [color=#F6CD26][KEY][/color] from the drawer.","default","default",0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
