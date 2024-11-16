extends CanvasLayer

const life_heart_empty = preload("res://ilustraciones/life_heart_empty.png")
const life_heart = preload("res://ilustraciones/life_heart.png")

func _on_game_controller_spaceship_hurt_updated(new_life_spaceship: Variant) -> void:
	$HBoxContainer/LifeHeart1.texture = life_heart if new_life_spaceship >= 1 else life_heart_empty
	$HBoxContainer/LifeHeart2.texture = life_heart if new_life_spaceship >=2 else life_heart_empty
	$HBoxContainer/LifeHeart3.texture = life_heart if new_life_spaceship >=3 else life_heart_empty
	


func _on_game_controller_time_updated(seconds_left: Variant) -> void:
	$TextureRect/Label.text = str(seconds_left)
