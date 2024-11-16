class_name municion 
extends Area2D

@export var alien = preload("res://Enemigos/Alien_.tscn")
@export var asteroide_ = preload("res://Enemigos/asteroide_.tscn")
@export var speed = 300
var velocity = Vector2()

#Recibe la posicion inicial y direccion de la bala 
func start(start_position, direction):
	position = start_position
	velocity = direction * speed

func _process(delta: float):
	position += velocity * delta 	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void: #Desaparezca la bala cuando se salga del viewport
	queue_free()
	

func _on_body_entered(body: Node2D) -> void:
	if body is Asteroide_:
		emit_signal("asteroide hurt")
		body.queue_free()  # Destruir el asteroide
		queue_free()  # Destruir la bala
	elif body is Alien_:
		emit_signal("alien hurt")
		body.queue_free()
		queue_free()
			
