class_name level_1

extends Node2D

#@export var municion:Area2D #Referencia a la escena municion
#@export var municion = preload("res://Municion/municion.tscn")

@export var asteroide_ = preload("res://Enemigos/asteroide_.tscn")
@export var municion = preload("res://Municion/municion.tscn")

func _on_nave_espacial_fired(bullet_position, bullet_direction):
	var bullet = municion.instantiate() #Crear instanciacion de la bala 
	bullet.start(bullet_position, bullet_direction)#Decirle a la bala desde donde se dibujara 
	add_child(bullet) #Añadir bala como hijo del nivel 
	
	
func crear_asteroides():
	var asteroides = asteroide_.instantiate()
	add_child(asteroides)
	
func _process(delta):
	pass 
	

	
	
