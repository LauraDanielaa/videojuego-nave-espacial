class_name NaveEspacial
extends CharacterBody2D

signal fired
signal nave_hurt()
var control_disparo = true 
@export var gravity = 100
@export var speed = 400
@export var float_force = 1000
@export var vida = 1

func _physics_process(delta):
	
	velocity.y -= float_force * delta
	
	# Aplicar la gravedad (si es necesario
	
		# Girar la nave hacia el puntero del mouse
	var mouse_position = get_global_mouse_position()
	look_at(mouse_position)
	
	#Gravedad
	if not is_on_floor():
		velocity.y = velocity.y + gravity * delta
	
	#movimiento 
	var direction =  Input.get_vector("izquierda", "derecha", "arriba", "abajo")
	velocity = direction * speed
	

	move_and_slide()
	
#func _on_DamageArea_body_entered(body):
	
			
func _on_damage_area_body_entered(body: Node2D) -> void:
	if body is Asteroide_:
		vida -= 1
		if vida <= 0:
			print("MUERTO")
			get_tree().quit()  # Cerrar el juego
				
				
func _process(delta):
	
	if Input.is_action_just_pressed("disparar"):
		var bullet_direction = Vector2.RIGHT.rotated(rotation) # Obtener la dirección hacia donde apunta la nave
		emit_signal("fired", $bullet_position.global_position, bullet_direction) # Pasar la posición y la dirección de la bala		


func _on_timer_timeout() -> void:
	control_disparo = true 
	print("reload")
