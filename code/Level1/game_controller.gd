extends Node2D

@export var life_spaceship = 3
signal spaceship_hurt_updated(new_life_spaceship) #parametro que informa cuantas vidas le quedan a la nave

func game_victory():
	print("You win :)")
	
func game_over():
	print("You lose the game")	
	get_tree().quit()  


func _on_spaceship_spaceship_hurt() -> void:
	if life_spaceship > 1:
		life_spaceship -= 1
		spaceship_hurt_updated.emit(life_spaceship)
	else:
		spaceship_hurt_updated.emit(life_spaceship)
		game_over()
		
			
	
