extends Button

@onready var background_sprite: Sprite2D = $backgroundSprite
@onready var container: CenterContainer = $CenterContainerte

var itemStackGui: ItemStackGui

func insert(isg: ItemStackGui):
	itemStackGui = isg
	container.add_child(itemStackGui)
