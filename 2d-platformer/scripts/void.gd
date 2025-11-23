extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "MainCharacter":
		call_deferred("_reload_scene")

func _reload_scene() -> void:
	get_tree().reload_current_scene()
