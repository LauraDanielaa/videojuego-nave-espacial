extends RigidBody2D

@export var speed = 50  # Velocidad constante del gato
@onready var cat_animation = $CatAnimation

#func _on_control_blink_finished() -> void:
func _ready() -> void:
	cat_animation.play("cat_shooting_to_right")
	# Asignar una dirección aleatoria inicial
	var random_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	linear_velocity = random_direction * speed

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	# Asegurar que la velocidad sea constante
	if linear_velocity.length() != speed:
		linear_velocity = linear_velocity.normalized() * speed
		
		
