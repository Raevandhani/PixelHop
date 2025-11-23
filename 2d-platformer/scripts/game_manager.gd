extends Node

@onready var label: Label = $"../UI/Panel/PointsLabel"
@export var hearts : Array[Node]
var points = 0
var hp = 3

func decrease_health():
	hp -= 1
	print(hp)
	for h in 3:
		if (h < hp):
			hearts[h].show()
		else:
			hearts[h].hide()
			
	if (hp == 0):
		get_tree().reload_current_scene()

func add_point():
	points += 1
	print(points)
	label.text = "Points: " + str(points)
