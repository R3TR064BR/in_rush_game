extends Area2D
@onready var corpitcho = $"../../Corpitcho"





func _on_body_entered(body):
	if body.name =="Corpitcho":
		$AnimatedSprite2D.play("boomR")
		await $AnimatedSprite2D.animation_finished
		corpitcho._levedano(25)
		queue_free()
