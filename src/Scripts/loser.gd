extends CharacterBody2D

@export var speed = 300.0
@export var target: CharacterBody2D
@onready var states = {}

var state = "chase"

func _ready() -> void:
	for child in $States.get_children():
		states[child.name.to_lower()] = child


func _physics_process(delta: float) -> void:

	states[state].handle()

	move_and_slide()
	
