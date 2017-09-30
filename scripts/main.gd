extends Node2D

func _ready():
	pass


func _on_Clear_course_music_finished():
	var timer = get_node(@"../Timer")
	timer.start()

func _on_Timer_timeout():
	# Set credits scene
	get_tree().change_scene("res://scenes/Credits.tscn")
