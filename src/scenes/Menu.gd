extends Control

func _on_ExitButton_pressed():
	get_tree().quit();


func _on_StartButton_pressed():
	get_tree().change_scene("res://src/scenes/levels/Level1.tscn")
