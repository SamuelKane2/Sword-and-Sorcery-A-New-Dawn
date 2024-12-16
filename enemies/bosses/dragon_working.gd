extends CharacterBody2D

# Declare the health variable with a default value or fetch it from another part of your code
var skeletonHealth = 100  # Example starting health
var health = skeletonHealth
var speed = 40
var player_chase = false
var player = null

@onready var attack_timer = $AttackTimer  # Timer for delay after hit

var randomnum
var target

enum {
	SURROUND,
	ATTACK,
	HIT,
}

var state = SURROUND
var dead = false

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	randomnum = rng.randf()
	dead = false

	# Connect the attack timer timeout signal
	attack_timer.timeout.connect(self._on_attack_timer_timeout)  # Correct signal connection

func _physics_process(_delta):
	# If the player is detected, start chasing
	if player_chase:
		# Switch between states to determine behavior
		match state:
			SURROUND:
				move(get_circle_position(randomnum), _delta)  # Surround behavior

			ATTACK:
				move(player.global_position, _delta)  # Move towards the player
				# Play attack animation if in attack state
				$AnimatedSprite.play("bdAttack")

			HIT:
				# If hit, stop movement and play the attack animation
				$AnimatedSprite.play("bdAttack")  # Play attack animation
				move(player.global_position, _delta)  # Continue moving towards the player
				# After hit, wait before going back to surround
				if attack_timer.is_stopped():  # Check if the timer is not running (stopped)
					attack_timer.start(2.0)  # Start the timer with a delay (2 seconds)

		# If state is not HIT or ATTACK, play the movement animation
		if state != HIT and state != ATTACK:
			$AnimatedSprite.play("bdMovement")

		# Flip the sprite based on the player's position
		if player.position.x - position.x < 0:
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
	else:
		# If player is not detected, stay idle and do not move
		$AnimatedSprite.play("bdIdle")
		# No movement when player is not detected


	# Handle the collision range detection enable/disable based on death state
	if !dead:
		$detection_range/CollisionShape2D.disabled = false
	else:
		$detection_range/CollisionShape2D.disabled = true

# Movement logic that uses steering to move toward the target position
func move(target_position, delta):
	# Calculate the direction and normalize it
	var direction = (target_position - global_position).normalized()

	# Calculate desired velocity (movement speed in the direction)
	var desired_velocity = direction * speed

	# Calculate steering to apply to the velocity
	var steering = (desired_velocity - velocity) * delta * 2.5

	# Apply the steering force to the velocity
	velocity += steering

	# Apply the velocity to the character's movement
	move_and_slide()  # No arguments needed in Godot 4

# Calculate a random position around the player for surrounding behavior
func get_circle_position(random):
	var kill_circle_centre = player.global_position
	var radius = 40
	var angle = random * PI * 2
	var x = kill_circle_centre.x + cos(angle) * radius
	var y = kill_circle_centre.y + sin(angle) * radius
	return Vector2(x, y)

# This function is triggered when the attack_timer times out
func _on_attack_timer_timeout():
	# After timer finishes, switch back to SURROUND state
	if state == HIT:
		state = SURROUND
		print("Returning to SURROUND state.")

# Handle player detection events
func _on_detection_area_body_entered(_body):
	# When player enters the detection range, start chasing
	player = _body
	player_chase = true

func _on_detection_area_body_exited(_body):
	# When player leaves the detection range, stop chasing
	player = null
	player_chase = false
