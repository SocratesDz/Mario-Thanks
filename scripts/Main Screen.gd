extends Node2D

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_Start_released():
	get_tree().change_scene("res://scenes/Level.tscn")




func _on_Quit_released():
	get_tree().quit()
