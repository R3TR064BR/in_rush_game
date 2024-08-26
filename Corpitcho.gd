
extends CharacterBody2D# Personagem


const SPEED = 200.0 # Velocidade do personagem
const JUMP_VELOCITY = -355.0 # Força do pulo do personagem
var estapulando = false
var vida = 100 
var is_takingDamage = false
var movement = false

@export var knockbackpower: int = 700

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")# Gravidade geral 
signal death

func _physics_process(delta): # Fisica geral do personagem 
	
	# Add the gravity.
	if not is_on_floor(): # Gravidade fazerá com que o personagem caia se não houver chão
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and !is_takingDamage:
		velocity.y = JUMP_VELOCITY # Comando para o persongem para pular
		estapulando = true
	else:
		estapulando = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	# Comando para andar direita e esquerda
	#movimentação
	if direction !=0 && !is_takingDamage:
		movement = true
		velocity.x = direction * SPEED # Velocidade do andar do personagem em direção específica 
		$Animation.scale.x = direction
	else:
		movement = false
		velocity.x = move_toward(velocity.x, 0, SPEED)
	updateAnim()
		# Comando para o personagem desacelerar 
				
	move_and_slide()
	
func updateAnim():
	if !is_takingDamage:
		if is_on_floor():
			if estapulando:				
				$Animation.play("jump")
			elif movement:
					$Animation.play("run")
			elif !movement: #personagem parado				
				$Animation.play("idle")
		# Comando para o personagem andar
		else:			
			if velocity.y < 0 :
				$Animation.play("jump")
			elif velocity.y > 0 :
				$Animation.play("fall")
	
func _levedano(dano):
	
	is_takingDamage = true
	_knockback() 
	#velocity.x = -400
	#animação dano
	$Animation.play("hit")
	await $Animation.animation_finished
	is_takingDamage = false
	
	#subtraindo a vida
	vida -= dano
	if vida <= 0:
		_Morreu()
		
	
	print(vida)
	
func _Morreu():
	emit_signal("death")
	print("DIED")
	
func _knockback():
	var knockbackdirection = -velocity.normalized() * knockbackpower
	velocity = knockbackdirection
	move_and_slide()
	
