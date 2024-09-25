class_name Asteroide_
extends CharacterBody2D

#@export var gravity = 100
var move_velocity = Vector2()  # Cambiamos el nombre de la variable velocity para evitar conflicto
var screen_size = Vector2()  # Declaramos screen_size como una variable global
@export var speed = 150
@export var float_force = 980

func _ready() -> void:
	# Utilizar un método para saber el tamaño que tiene el viewport
	screen_size = get_viewport().get_visible_rect().size  # (1152, 648)
	
	# Asignación de una dirección aleatoria y una velocidad constante 
	randomize()  
	var random_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()  # Valores entre -1 y 1 por un círculo unitario
	move_velocity = random_direction * speed  # Usamos move_velocity para el movimiento
	
	
func _process(delta):
	# Determinar la posición de los asteroides 
	var position = self.position 
	
	# El viewport se posiciona desde la coordenada (0,0)
	if position.x <= 0 or position.x >= screen_size.x:
		move_velocity.x = -move_velocity.x  # Invertir dirección en el eje X
	if position.y <= 0 or position.y >= screen_size.y:
		move_velocity.y = -move_velocity.y  # Invertir dirección en el eje Y
	
   # Mover el asteroide con move_and_collide
	move_and_collide(move_velocity * delta)  # Usamos move_and_collide en lugar de move_and_slide
