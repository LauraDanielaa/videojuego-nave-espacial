extends TextureButton

@onready var panel_principal = $"../../../../../.."
@onready var exit_button_audio = $AudioStreamPlayer2D
 
func _on_pressed() -> void:
	exit_button_audio.playing = true		
	panel_principal.hide()		
