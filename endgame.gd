extends CanvasLayer




func _on_button_pressed():
	get_tree().quit()

		#get_tree().change_scene_to_file("res://level.tscn")


func _on_bt_reset_2_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://level.tscn")
