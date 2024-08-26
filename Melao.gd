extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Pontos: " + str(Global.somacoletavel)

func _on_coletavel_body_entered(body):
	$Label.text = "Pontos: " + str(Global.somacoletavel)
