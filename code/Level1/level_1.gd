class_name level_1

extends Node2D

#@export var municion:Area2D #Referencia a la escena municion
#@export var municion = preload("res://Municion/municion.tscn")

@export var municion = preload("res://Municion/municion.tscn")

func _on_nave_espacial_fired(bullet_position):
	
	var bullet = municion.instantiate() #Crear instanciacion de la bala 
	bullet.start(bullet_position)#Decirle a la bala desde donde se dibujara 
	add_child(bullet)
	
	
