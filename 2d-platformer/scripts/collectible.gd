extends Area2D

@onready var game_manager: Node = %GameManager
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "MainCharacter"):
		sprite.play("collected")
		game_manager.add_point()
		await sprite.animation_finished
		queue_free()
