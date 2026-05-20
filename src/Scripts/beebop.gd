extends CharacterBody2D

@export_group("Physics")
@export var speed: float = 300.0
@export var jump_velocity: float = -400.0

var bullet_kind: bool = false

@onready var bullet_scene: PackedScene = preload("res://Scenes/basic_bullet.tscn")

func _process(_delta):
	if $SotCooldown.is_stopped() and Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(_delta):
	var direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	
	if direction:
		velocity = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	
	move_and_slide()

func shoot():
	$SotCooldown.start()
	var bullet: Area2D = bullet_scene.instantiate()
	bullet.kind = bullet_kind
	bullet_kind = not bullet_kind
	bullet.global_position = global_position
	bullet.look_at(get_viewport().get_mouse_position())
	get_parent().add_child(bullet)

func _on_sot_cooldown_timeout():
	if Input.is_action_pressed("shoot"):
		shoot()
