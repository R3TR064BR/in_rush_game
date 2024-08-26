extends Area2D




func _on_body_entered(body):
	if body.name == "Corpitcho":
		$AnimatedSprite2D.play("Tcollect")
		await $AnimatedSprite2D.animation_finished
		get_tree().change_scene_to_file("res://coletavel/canvas_layer.tscn")
