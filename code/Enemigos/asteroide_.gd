class_name Asteroide_
extends RigidBody2D

#@export var gravity = 100
@export var speed = 150
@export var float_force = 980

func _process(delta):
	if position.y > 1000:
		queue_free()
	
func _physics_process(delta):
	#Aplica una fuerza hacia arriba para simular flotación
	apply_central_force(Vector2(0, -float_force)) 

# Variables
 # Velocidad de movimiento de los asteroides

func _ready():
	randomize()  # Randomiza la semilla para obtener valores aleatorios diferentes en cada ejecución
	var random_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	var velocity = random_direction * speed
	linear_velocity = velocity
	
# Al iniciar el juego, asigna una dirección y velocidad aleatoria
