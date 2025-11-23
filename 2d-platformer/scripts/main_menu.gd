extends Node

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://start_menu.tscn")
	
func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://levels/level1.tscn")

func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level2.tscn")

func _on_level_3_pressed() -> void:
	pass
