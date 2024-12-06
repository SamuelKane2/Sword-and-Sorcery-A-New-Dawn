extends CharacterBody2D

@export var speed : float = 100
@export var attack_range : float = 50
@export var attack_damage : int = 10
@export var attack_cooldown : float = 1.0  # seconds between attacks

var player : Node2D = null
var can_attack : bool = true

func _ready():
	# Get the player node, assuming it's named "Player" in the scene.
	player = get_node("/root/Game/Player")  # Adjust path as necessary

func _process(_delta: float) -> void:
	if player:
		var direction = player.position - position
		var distance = direction.length()

		# Move towards the player
		if distance > attack_range:
			move_and_slide()
		else:
			# Attack the player if within range
			if can_attack:
				attack_player()
				can_attack = false
				# Cooldown between attacks
				await get_tree().create_timer(attack_cooldown).timeout
				can_attack = true

func attack_player() -> void:
	print("Attacking Player!")
	# You can apply damage to the player here. For example:
	if player.has_method("take_damage"):
		player.call("take_damage", attack_damage)
