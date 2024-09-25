class_name NaveEspacial
extends CharacterBody2D

signal fired
#var control_disparo = true 
@export var gravity = 100
@export var speed = 400
@export var float_force = 1000

func _physics_process(delta):
	
	velocity.y -= float_force * delta
	
	# Aplicar la gravedad (si es necesario
	
	#Gravedad
	if not is_on_floor():
		velocity.y = velocity.y + gravity * delta
	
	#Movimiento horizontal
	var direction = Input.get_axis("izquierda", "derecha")
	velocity.x = speed * direction 

   #Movimiento vertical
	var up_and_down = Input.get_axis("arriba", "abajo")
	velocity.y = speed * up_and_down 
	
 # Girar la nave hacia el puntero del mouse
	look_at(get_global_mouse_position())
	
	move_and_slide()

func _process(delta):
	if Input.is_action_pressed("disparar"): # and control_disparo:
		print("fire...")
		#control_disparo = false
		emit_signal("fired", $bullet_position.global_position ) #Se le pasa el parametro bullet_position para indicarle en donde quiero que salga el disparo 
		#posicion_global con respecto a la pantalla 
