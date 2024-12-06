extends collect

func collect(inventory: Inventory):
	super(inventory)


func _on_body_entered(body: Node2D) -> void:
	print("Potion detect")
