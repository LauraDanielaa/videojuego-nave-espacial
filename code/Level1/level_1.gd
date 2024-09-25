extends Node2D

@export var municion:Area2D #Referencia a la escena municion

func _on_nave_espacial_fired(bullet_position):
	
	var bullet = municion.instance() #Crear instanciacion de la bala 
	municion.start(bullet_position)#Decirle a la bala desde donde se dibujara 
	add_child(municion)
	
	
