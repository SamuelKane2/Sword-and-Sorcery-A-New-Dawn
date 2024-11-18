extends Button

@onready var background_sprite: Sprite2D = $backgroundSprite
@onready var item_sprite: Sprite2D = $CenterContainer/Panel/itemSprite

func update(item: InventoryItem):
	if !item:
		item_sprite.visible = false
	else:
		item_sprite.visible = true
		item_sprite.texture = item.texture
