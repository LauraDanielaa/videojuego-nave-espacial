class_name SpaceCatTrooper
extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
@export var alien = preload("res://Enemigos/Alien_.tscn")
@export var asteroide_ = preload("res://Enemigos/asteroide_.tscn")
signal fired
signal spaceship_hurt()
var control_disparo = true 
@export var gravity = 100
@export var speed = 400
@export var float_force = 1000

func _ready() -> void:
	animation.play("cat_shooting_right")
	
func _physics_process(delta):
	velocity.y -= float_force * delta
	var mouse_position = get_global_mouse_position()
	look_at(mouse_position)

	#Gravedad
	if not is_on_floor():
		velocity.y = velocity.y + gravity * delta
	
	#movimiento 
	var direction =  Input.get_vector("izquierda", "derecha", "arriba", "abajo")
	velocity = direction * speed

	move_and_slide()
	
	# Cambiar animación según dirección de movimiento horizontal
	if direction.x > 0:  # Moviéndose hacia la derecha
		if animation.animation != "cat_shooting_right":
			animation.play("cat_shooting_right")
	elif direction.x < 0:  # Moviéndose hacia la izquierda
		if animation.animation != "cat_shooting_left":
			animation.play("cat_shooting_left")	
	
	
func _on_damage_area_body_entered(body: Node2D) -> void:
	if body is Alien_ or body is Asteroide_:
		print("ha recibido daño")
		spaceship_hurt.emit()
		
func _process(delta):
	
	if Input.is_action_just_pressed("disparar"):
		var bullet_direction = Vector2.RIGHT.rotated(rotation) # Obtener la dirección hacia donde apunta la nave
		emit_signal("fired", $bullet_position.global_position, bullet_direction) # Pasar la posición y la dirección de la bala		


func _on_timer_timeout() -> void:
	control_disparo = true 
	print("reload")
