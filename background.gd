extends Node2D

const BACKGROUND_SPEED = -510.0
const BACKGROUND_LOOP_WIDTH = 1560.0
const BACKGROUND_BEACH_OFFSET = 3300.0

var loop_count = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Move the background
	var position = get_position()
	position.x += BACKGROUND_SPEED * delta
	
	# Check if we need to loop the background
	if loop_count < 7 and position.x < -BACKGROUND_LOOP_WIDTH:
		position.x = 0.0
		loop_count += 1
		
	if position.x < -(BACKGROUND_LOOP_WIDTH + BACKGROUND_BEACH_OFFSET):
		position.x = -BACKGROUND_BEACH_OFFSET
	
	set_position( position )
