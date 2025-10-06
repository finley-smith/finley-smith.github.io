extends CharacterBody2D

const SPEED = 0
const JUMP_VELOCITY = -600.0

@export var ground_hitbox: Area2D
@export var death_hitbox: Area2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()
	
	for node in death_hitbox.get_overlapping_areas():
		if node.is_in_group("death"):
			get_tree().change_scene_to_file("res://death_screen.tscn")

func on_area2D_area_entered(area):
	show()

@onready var animated_sprite_2d = $AnimatedSprite2D

# called when the scene enteres the scene tree for the first time.
func _ready():
	animated_sprite_2d.play("hoppiwalk")


# called every frame. 'delta' is the elapsed time since previ
func _process(delta):
	pass
