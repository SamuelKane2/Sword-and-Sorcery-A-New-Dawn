extends Area2D

@export var itemRes: InventoryItem

func _on_body_entered(body: Node2D) -> void:
	queue_free()
