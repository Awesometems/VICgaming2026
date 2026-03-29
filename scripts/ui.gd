extends Control

@onready var room_name_label = $CanvasLayer/roomName

var selected = "none"
var dcrowx
var dcrowy
var dkeyx 
var dkeyy
var dgearx
var dgeary

func _ready() -> void:
	room_name_label.text = Map.room_names[Player.currentLocation]
	itemcheck()
	popnotes()
	$Notebook.visible = false
	$crowbar.pivot_offset = $crowbar.size / 2
	$key.pivot_offset = $key.size / 2
	$gear.pivot_offset = $gear.size / 2
	dcrowx = $crowbar.scale.x
	dcrowy = $crowbar.scale.y
	dkeyx = $key.scale.x
	dkeyy = $key.scale.y
	dgearx = $gear.scale.x
	dgeary = $gear.scale.y

func popnotes():
	$"Notebook/Control/1".text = Tracking.notes[0]
	$"Notebook/Control/2".text = Tracking.notes[1]
	$"Notebook/Control/3".text = Tracking.notes[2]
	$"Notebook/Control/4".text = Tracking.notes[3]
	$"Notebook/Control/5".text = Tracking.notes[4]

func itemcheck():
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
	

func _on_notes_pressed() -> void:
	$Notebook.visible = !$Notebook.visible

# crowbarbutton
func _on_button_pressed() -> void:
	Tracking.crowbar = 1
	$crowbar.disabled = false
	$crowbar.visible = true

func _on_crowbar_pressed() -> void:
	selected = "crowbar"
	defaulticons()
	$crowbar.scale.x *= 1.2
	$crowbar.scale.y *= 1.2

func defaulticons():
	$crowbar.scale.x = dcrowx
	$crowbar.scale.y = dcrowy
	$key.scale.x = dkeyx
	$key.scale.y = dkeyy
	$gear.scale.x = dgearx
	$gear.scale.y = dgeary
