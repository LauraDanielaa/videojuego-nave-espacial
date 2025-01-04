extends RigidBody2D

@export var speed = 60  # Velocidad constante del gato

func _ready():
	var random_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	linear_velocity = random_direction * speed

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	# Asegurar que la velocidad sea constante
	if linear_velocity.length() != speed:
		linear_velocity = linear_velocity.normalized() * speed
		
