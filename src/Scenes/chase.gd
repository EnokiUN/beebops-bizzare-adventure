extends Node

@onready var loser: CharacterBody2D = $"../.."


func handle(): 

	if !loser.target: return
	$NavigationAgent2D.target_position = loser.target.position
	var direction = loser.position.direction_to($NavigationAgent2D.get_next_path_position())
	loser.velocity = direction * loser.speed
