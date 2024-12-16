extends Button

@onready var background_sprite: Sprite2D = $backgroundSprite
@onready var center_container: CenterContainer = $CenterContainerte

#               : ItemStackGui
var itemStackGui

func insert(isg):
	itemStackGui = isg
	center_container.add_child(itemStackGui)
