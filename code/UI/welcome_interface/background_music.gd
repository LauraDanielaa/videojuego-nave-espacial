extends AudioStreamPlayer2D

func _on_finished() -> void:
	play()


func _on_start_button_pressed() -> void:
	fade_out_music()
	
func fade_out_music() -> void:
	var tween = self.create_tween()
	tween.tween_property(self, "volume_db", -80, 2.0)\
	.set_trans(Tween.TRANS_LINEAR)\
	.set_ease(Tween.EASE_IN_OUT)
	
func _on_fade_out_complete() -> void:
	stop()
	volume_db = 0  # Restablece el volumen para futuras reproducciones
