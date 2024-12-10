extends CharacterBody2D

const max_speed = 80
const max_speed_run = 160  # Max speed when Shift is held
const accel = 300
const accel_run = 600  # Acceleration when Shift is held
const friction = 1000

enum {IDLE, MOVE, RUN}
var state = IDLE  # Default state is IDLE

@onready var animationTree = $AnimationTree
@onready var state_machine = animationTree["parameters/playback"]

var blend_position : Vector2 = Vector2.ZERO
var blend_pos_paths = [
	"parameters/Idle/Idle_blend/blend_position",  # For idle state
	"parameters/Move/move_blend/blend_position",  # For moving
	"parameters/Run/run_blend/blend_position"    # For running
]

var animTree_state_keys = [
	"Idle",
	"Move",
	"Run"
]

func _ready():
	# Ensure the initial state is idle
	state_machine.travel(animTree_state_keys[IDLE])

func _physics_process(delta):
	move(delta)
	animate()

func move(delta):
	var input_vector = Input.get_vector("left", "right", "up", "down")

	# Check if Shift is held to increase speed and acceleration
	var is_running = Input.is_action_pressed("shift")

	# Set max_speed and accel based on whether running or not
	var current_max_speed = max_speed
	var current_accel = accel
	if is_running and input_vector != Vector2.ZERO:
		current_max_speed = max_speed_run
		current_accel = accel_run
		state = RUN  # Set state to RUN when Shift is held and moving
	elif input_vector != Vector2.ZERO:
		state = MOVE  # Set state to MOVE if there's input
	else:
		state = IDLE  # Set state to IDLE if no input

	if input_vector == Vector2.ZERO:
		# Apply friction when no input is given
		apply_friction(friction * delta)
		velocity = Vector2.ZERO  # Explicitly stop the character
	else:
		# Apply movement when there is input
		apply_movement(input_vector * current_accel * delta, current_max_speed)
		blend_position = input_vector.normalized()  # Normalize to avoid diagonal speed boost

	move_and_slide()

func apply_friction(amount) -> void:
	# Apply friction if velocity is not zero
	if velocity.length() > 0:
		velocity -= velocity.normalized() * amount
		# Ensure that the velocity does not go below a small threshold
		if velocity.length() < 1:
			velocity = Vector2.ZERO
	else:
		velocity = Vector2.ZERO

func apply_movement(amount, current_max_speed) -> void:
	# Apply movement acceleration and limit speed
	velocity += amount
	velocity = velocity.limit_length(current_max_speed)

func animate() -> void:
	# Set the animation state based on movement and priority to running
	state_machine.travel(animTree_state_keys[state])

	# Pass the blend_position to animation tree to blend between animations
	animationTree.set(blend_pos_paths[state], blend_position)

	# You can add debugging here to make sure blend_position is updating
	#print("Blend Position: ", blend_position)

# Player Inventory #
@export var inventory: Inventory
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.has_method("collect"):
		area.collect(inventory)
