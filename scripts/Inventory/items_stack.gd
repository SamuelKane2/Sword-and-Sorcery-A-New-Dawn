extends Panel

class_name ItemStack

@onready var item_sprite: Sprite2D = $itemSprite

var inventorySlot

func update():
	if !inventorySlot || inventorySlot.item: return
