extends Area2D

var ponto = 1

func _on_body_entered(body):
	if body.name == "Corpitcho":
		Global.somacoletavel += ponto
		print(Global.somacoletavel)
		$Anim_item.play("boom")
		await $Anim_item.animation_finished
		queue_free()#tirar da cenavar


