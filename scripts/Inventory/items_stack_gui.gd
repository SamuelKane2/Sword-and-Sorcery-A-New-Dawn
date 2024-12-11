extends Panel

class_name ItemStack

@onready var itemSprite: Sprite2D = $item

var inventorySlot

func update():
	if !inventorySlot || inventorySlot.item: return
	
	itemSprite.visible = true
	itemSprite.texture = inventorySlot.item.texture
