extends Camera2D

onready var left_limit = get_node("/root/Level/main/Left Limit")
onready var right_limit = get_node("/root/Level/main/Right Limit")

func _ready():
	set_limit(MARGIN_LEFT, left_limit.get_pos().x)
	set_limit(MARGIN_RIGHT, right_limit.get_pos().x)
