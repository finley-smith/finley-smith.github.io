extends Node

const MIN_SPAWN_TIMER = 1.1
const MAX_SPAWN_TIMER = 2.0

var rng = RandomNumberGenerator.new()

var next_spawn_time = 0.0

@export var car_red: PackedScene
@export var spawn_position: Node2D
@export var score_label: RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var time = Time.get_ticks_msec() / 1000.0
	
	if time > next_spawn_time:
		spawn()
		
	Global.score += delta * 100

	score_label.clear()
	score_label.append_text(str(int(Global.score)))


func spawn() -> void:
	var new_car = car_red.instantiate()
	add_child(new_car)
	new_car.global_position = spawn_position.global_position
	
	var time = Time.get_ticks_msec() / 1000.0
	
	next_spawn_time = time + rng.randf_range(MIN_SPAWN_TIMER, MAX_SPAWN_TIMER)
