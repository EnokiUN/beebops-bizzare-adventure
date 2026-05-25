extends Node

@export var chase_distance = 300
@onready var loser: CharacterBody2D = $"../.."

func handle(): 
	if !loser.target: return
	if loser.position.distance_to(loser.target.position) < chase_distance:
		loser.state = "attack"
		loser.velocity = Vector2.ZERO
		return
	%NavigationAgent.target_position = loser.target.position
	var direction = loser.position.direction_to(%NavigationAgent.get_next_path_position())
	loser.velocity = direction * loser.speed
