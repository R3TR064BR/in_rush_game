extends Area2D

@onready var corpitcho = $"../Corpitcho"


func _on_body_entered(body):
	if body.name == "Corpitcho":
		corpitcho._levedano(200)

