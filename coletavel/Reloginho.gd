extends Area2D

@onready var control = $"../../Hudzinha/Control"


func _on_body_entered(body):
	if body.name == "Corpitcho":
		control.segundos += 15
		$AnimatedSprite2D.play("receclock")
		await $AnimatedSprite2D.animation_finished
		queue_free()







