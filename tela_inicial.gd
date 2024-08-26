extends CanvasLayer




func _on_iniciar_pressed():
	get_tree().change_scene_to_file("res://level.tscn")



func _on_sair_pressed():
	get_tree().quit()
