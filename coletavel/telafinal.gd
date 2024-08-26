extends CanvasLayer



func _on_bt_final_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://tela_inicial.tscn")
