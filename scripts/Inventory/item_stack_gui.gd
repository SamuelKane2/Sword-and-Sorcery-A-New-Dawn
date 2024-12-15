extends Panel

class_name ItemStackGui

@onready var itemSprite: Sprite2D = $itemSprite

#                : InventorySlot
var inventorySlot

func update():
	if !inventorySlot || inventorySlot.item: return
	
	itemSprite.visible = true
	itemSprite.texture = inventorySlot.item.texture