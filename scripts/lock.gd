extends Control
signal check

var val = 10000

func _on_up_pressed() -> void:
	val += 1
	$RichTextLabel.text = str(abs(val%10))
	check.emit()


func _on_down_pressed() -> void:
	val -= 1
	$RichTextLabel.text = str(abs(val%10))
	check.emit()
