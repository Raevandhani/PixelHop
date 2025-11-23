extends RigidBody2D

@onready var game_manager: Node = %GameManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_hitbox_body_entered(body: Node2D) -> void:
	if (body.name == "MainCharacter"):
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		
		print(y_delta)
		if(y_delta > 30):
			queue_free()
			body.jump()
		else:
			if(x_delta > 0):
				body.flinch(500)
			else:
				body.flinch(-500)
				
			game_manager.decrease_health()
