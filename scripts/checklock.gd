extends Control

var password = ["2","7","1","8"]

func _on__check() -> void:
	if $"1/RichTextLabel".text == password[0] and $"2/RichTextLabel".text == password[1] and $"3/RichTextLabel".text == password[2] and $"4/RichTextLabel".text == password[3]:
		pass #do something
