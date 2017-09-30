extends Area2D

onready var sound = get_node("/root/Level/Coin sound")

func _on_Coin_body_enter( body ):
	if(body extends preload("res://scripts/Player.gd")):
		sound.play("coin", true)
		queue_free()
