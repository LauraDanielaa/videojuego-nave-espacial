extends Button

@export var right_panel_text : RightPanelText # Instanciación del recurso
@onready var rich_text_label =  $"../../../VBoxContainer/RightPanel/CenterContainer/RichTextLabel"
@onready var open_options_button_audio = $AudioStreamPlayer2D

func _ready():
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	open_options_button_audio.playing = true
	
	var tween = self.create_tween()  
	tween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.1)
	tween.tween_property(self, "scale", scale, 0.1)\
		.set_trans(Tween.TRANS_BOUNCE)\
		.set_ease(Tween.EASE_OUT)

	rich_text_label.text = right_panel_text.help_text
	
