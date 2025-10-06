extends RigidBody2D

const CAR_SPEED = 900.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	global_position.x -= CAR_SPEED * delta
