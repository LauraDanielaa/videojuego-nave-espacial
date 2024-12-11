extends Button

@onready var start_button_audio = $AudioStreamPlayer2D



func _on_pressed() -> void:
	var tween = self.create_tween()  
	tween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.1)
	tween.tween_property(self, "scale", scale, 0.1)\
		.set_trans(Tween.TRANS_BOUNCE)\
		.set_ease(Tween.EASE_OUT)
	
	start_button_audio.playing = true 
