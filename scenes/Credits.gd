extends Node

var credits = [
	"Agradecimientos especiales:",
	"Rafael Contreras",
	"Arturo Manzueta",
	"Abraham Durán",
	"Edgar Pérez",
	"Enmanuel Jimenes",
	"Jesus Méndez",
	"Saulo Carrasco",
	"Eddy Fidel",
	"Silverio del Orbe",
	"Wilson Reyes",
	"Yeison Lapaix",
	"Mirla del Río",
	"Noel Gutierrez",
	"Indrany Eve",
	"Alexis Mateo",
	"Steven Madaschi",
	"Astianax López",
	"Nery Campusano",
	"Gabriel Pichardo",
	"Joan Prensa",
	"Y a todos los que faltan...",
	"GRACIAS POR TODO",
	"P.D.: No se preocupen por el orden.\nYo tampoco lo hice."
]

var counter = 0

func _ready():
	pass

func next_credit():
	if(counter < credits.size()):
		get_node("Control/Text").set_text(credits[counter])
		counter += 1
	else:
		# Set timer for changing scene
		get_node("Control/Text").set_text("")
		get_tree().change_scene("res://scenes/Main Screen.tscn")
