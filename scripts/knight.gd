extends CharacterBody2D

const Acceleration = 800
const Friction = 500
const Max_Speed = 120

enum {Idle, Run}
var state = Idle

@onready var animationTree = $AnimationTree
@onready var state_machine = animationTree["parameters/playback"]

var blend_position : Vector2 = Vector2.ZERO
var blend_position_paths = [
	"parameters/idle/idle_bs2d/blend_position",
	"parameters/run/run_bs2d/blend_position"
]
var animTree_state_keys = [
	"idle",
	"run"
]

func _physics_process(delta):
	move(delta)
	animate()

func move(delta):
	var input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if input_vector == Vector2.ZERO:
		state = Idle
		apply_friction(Friction * delta)
	else:
		state = Run
		apply_movement(input_vector * Acceleration * delta)
		blend_position = input_vector
	move_and_slide()

func apply_friction(amount) -> void:
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	else:
		velocity = Vector2.ZERO

func apply_movement(amount) -> void:
	velocity += amount
	velocity = velocity.limit_length(Max_Speed)

func animate() -> void:
	state_machine.travel(animTree_state_keys[state])
	animationTree.set(blend_position_paths[state], blend_position)
