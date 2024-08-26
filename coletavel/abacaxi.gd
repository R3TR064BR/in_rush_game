extends Area2D

var pontoesp = 25

func _on_body_entered(body):
	if body.name == "Corpitcho":
		Global.somacoletavel += pontoesp
		$AnimatedSprite2D.play("Zboom")
		await $AnimatedSprite2D.animation_finished
		queue_free()
