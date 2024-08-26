extends CanvasLayer

var game_paused

func _ready():
	visible = false 

func _on_bt_return_pressed():
	get_tree().paused = false
	visible = false

func _on_bt_reset_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://level.tscn")


func _on_bt_quit_pressed():
	get_tree().quit()


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		game_paused = !game_paused
		get_tree().paused = game_paused
		visible = game_paused

