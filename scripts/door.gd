extends Area2D
signal on_door_entered

# this script sets a countdown timer for how long the character is in the door area.
# if they are in the door area for more than 1.5 seconds, they transition to the next room

@onready var timer_in_door = $Timer
var wait := 1.5 # the amount of time the char is in the door before they switch rooms

func _on_body_entered(body: CharacterBody2D) -> void:
	timer_in_door.start()
	
func _on_body_exited(body: CharacterBody2D) -> void:
	timer_in_door.stop()
	timer_in_door.wait_time = wait # reset the time

func _on_timer_timeout() -> void:
	on_door_entered.emit()
