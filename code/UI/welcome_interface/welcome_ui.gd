extends Control

@onready var panel = $Panel 
@onready var objects = {
	$Node2D/AsteroidUI/AsteroidSprite: {"start_delay": 0.0, "blink_duration": 3.0},
	$Node2D/AsteroidUI2/AsteroidSprite2 : {"start_delay": 0.0, "blink_duration": 3.0},
	$Node2D/CatUI/CatAnimation : {"start_delay": 0.0, "blink_duration": 3.0},
	$PanelContainer: {"start_delay": 1.5, "blink_duration": 5.0},
	$PanelContainer/VBoxContainer/StartButton: {"start_delay": 3.3, "blink_duration": 3.0},
	$PanelContainer/VBoxContainer/InfoButton: {"start_delay": 2.8, "blink_duration": 3.0},
	$PanelContainer/VBoxContainer/VBoxContainer/Label: {"start_delay": 2.6, "blink_duration": 1.0},
	$PanelContainer/VBoxContainer/VBoxContainer/Label2:  {"start_delay": 2.6, "blink_duration": 1.0}
} 

@export var blink_interval = 0.2  # Intervalo entre cada titileo
@export var total_blink_duration = 3.0  # Tiempo total para sincronizar el fin del titileo

func _ready():
	hide_panel_objects()
	start_blinking()

func hide_panel_objects():
	for obj in objects.keys():
		if obj.name in ["PanelContainer", "StartButton", "InfoButton", "Label", "Label2"]:
			var tween = create_tween()
			tween.tween_property(obj, "self_modulate", Color(0, 0, 0, 0), 0.1).set_trans(Tween.TRANS_LINEAR)
			obj.visible = true  # Mantén los objetos visibles pero transparentes
			
func start_blinking():
	var max_blink_end_time = 0.0

	for obj in objects.keys():
		var start_delay = objects[obj]["start_delay"]
		var blink_duration = objects[obj]["blink_duration"]

		# Calcular el tiempo final más largo
		max_blink_end_time = max(max_blink_end_time, start_delay + blink_duration)

		# Crear un temporizador para iniciar el titileo con retraso
		var timer = Timer.new()
		timer.wait_time = start_delay
		timer.one_shot = true
		add_child(timer)

		# Conectar el temporizador al inicio del titileo
		timer.timeout.connect(func():
			_start_blinking_object(obj, blink_duration))
		timer.start()

	# Crear un temporizador para detener todos los titileos al final
	var final_timer = Timer.new()
	final_timer.wait_time = max_blink_end_time
	final_timer.one_shot = true
	add_child(final_timer)

	final_timer.timeout.connect(self._stop_all_blinking)
	final_timer.start()

func _start_blinking_object(obj, blink_duration):
	var tween = create_tween()
	var time_passed = 0.0

# Determinar el comportamiento según el nodo
	if obj.name in ["CatUI", "AsteroidUI", "AsteroidUI2"]:  # Claves de los nodos gato y asteroides
		while time_passed < blink_duration:
			tween.tween_property(obj, "visible", false, blink_interval / 2).set_trans(Tween.TRANS_LINEAR)
			tween.tween_property(obj, "visible", true, blink_interval / 2).set_trans(Tween.TRANS_LINEAR)
			time_passed += blink_interval
	else:  # Comportamiento para los demás elementos
		while time_passed < blink_duration:
			tween.tween_property(obj, "self_modulate", Color(0, 0, 0, 0), blink_interval / 2).set_trans(Tween.TRANS_LINEAR)  # Completamente transparente
			tween.tween_property(obj, "self_modulate", Color(1, 1, 1, 1), blink_interval / 2).set_trans(Tween.TRANS_LINEAR)
			time_passed += blink_interval

func _stop_all_blinking():
	for obj in objects.keys():
		if obj.is_inside_tree():  # Verificar que el objeto existe en la escena
			obj.self_modulate = Color(1, 1, 1, 1)  # Restablecer color original
			obj.visible = true
