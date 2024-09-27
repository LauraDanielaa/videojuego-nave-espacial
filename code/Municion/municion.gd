class_name municion 
extends Area2D

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
