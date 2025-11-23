extends Area2D

@export var target_level : PackedScene
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	if (body.name ==  "MainCharacter"):
		sprite.play("collected")
		await sprite.animation_finished
		get_tree().change_scene_to_packed(target_level)
