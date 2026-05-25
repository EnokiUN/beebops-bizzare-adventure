extends Node

@export var attack_distance = 250
@onready var loser: CharacterBody2D = $"../.."

func handle(): 
	if !loser.target: return
	if loser.position.distance_to(loser.target.position) > attack_distance:
		loser.state = "chase"
		return
