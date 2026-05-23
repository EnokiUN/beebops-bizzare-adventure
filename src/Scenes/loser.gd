extends CharacterBody2D

@export var speed = 300.0
@export var target: CharacterBody2D
@onready var states = $States.get_children()

var state = 0

func _physics_process(delta: float) -> void:

	states[state].handle()

	move_and_slide()
	
