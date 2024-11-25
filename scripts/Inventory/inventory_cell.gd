extends Button

@onready var background_sprite: Sprite2D = $backgroundSprite
@onready var center_container: CenterContainer = $CenterContainer

var itemStackGui: ItemStack

func insert(isg: ItemStack):
	itemStackGui = isg
	center_container.add_child(itemStackGui)

#func update(item: InventoryItem):
#	if !item:
#		item_sprite.visible = false
#	else:
#		item_sprite.visible = true
#		item_sprite.texture = item.texture
							 #slot.item.texture
