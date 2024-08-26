extends Control

@onready var timer_count = $MarginContainer/HBoxContainer2/timer_count as Label
@onready var contador_m = $MarginContainer/HBoxContainer/ContadorM as Label
@onready var timer = $Timer as Timer

signal tempo_acabou()

var minutos = 0
var segundos = 0

@export_range(0,2) var min_padrao = 1
@export_range(0,59) var seg_padrao = 0





func _ready():
	contador_m.text = str("%03d" %Global.somacoletavel)
	timer_count.text = str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)
	
	minutos = min_padrao
	segundos = seg_padrao
	
 
func _process(delta):
	contador_m.text = str("%03d" % Global.somacoletavel)
	if minutos == 0 && segundos == 0:
		emit_signal("Fim de Tempo") #emite sinal que o tempo acabou
	




func _on_timer_count_timeout():
	if segundos >= 60: 
		minutos += 1 
		segundos %= 60

	if segundos == 0:
		if minutos > 0:
			minutos -=1
			segundos = 60
			
	segundos -=1
	
	
	timer_count.text = str("%02d" % minutos) + ":" + str("%02d" % segundos) 
