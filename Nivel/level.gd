extends Node2D

@onready var corpitcho = $Corpitcho


func _ready():
	corpitcho.death.connect(_resetAll)
	Global.somacoletavel = 0
func _resetAll():
	get_tree().change_scene_to_file("res://endgame.tscn")
	
	


