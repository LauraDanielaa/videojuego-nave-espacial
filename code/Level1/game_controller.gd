extends Node2D

@export var life_spaceship = 3
@export var time = 100
signal time_updated(seconds_left)
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
		

func _on_timer_timeout() -> void:
	if time > 0:
		time -= 1
		time_updated.emit(time)
	else:
		game_victory()
		get_tree().quit()  
