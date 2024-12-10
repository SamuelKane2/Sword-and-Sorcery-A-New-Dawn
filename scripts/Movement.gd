extends CharacterBody2D

const max_speed = 80
const max_speed_run = 160  # Max speed when Shift is held
const accel = 300
const accel_run = 600  # Acceleration when Shift is held
const friction = 1000

var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true

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
	enemy_attack()
	update_health()

	if health <= 0:
		player_alive = false
		health = 0
		print("player dead")
		self.queue_free()

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

func _on_Attract_body_entered(body):
	if body.is_in_group("Enemy"):
		body.attack_timer.start()

func _on_Attract_body_exited(body):
	if body.is_in_group("Enemy"):
		body.attack_timer.stop()
		body.state = body.SURROUND

func _on_Attack_body_entered(body):
	if body.is_in_group("Enemy"):
		body.state = body.HIT

func _on_Attack_body_exited(body):
	if body.is_in_group("Enemy"):
		body.state = body.SURROUND
		enemy_inattack_range = false

func _on_hitbox_body_entered(body):
	if body.is_in_group("Enemy"):
		enemy_inattack_range = true

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true:
		health = health - 20
		enemy_attack_cooldown = false
		$attack_cooldown.start()
		print(health)


func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true


func update_health():
	var healthbar = $healthbar
	healthbar.value = health

	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true

func _on_regen_timer_timeout():
	if health < 100:
		health = health + 20
		if health > 100:
			health = 100
	if health <= 0:
		health = 0
