extends Area2D

@export var bullet_velocity: float = 15.0

var kind: bool

func _ready():
	$Icon.region_rect.position.x = 90 * 1 if kind else 0
	if abs(rotation) > PI/2:
		$Icon.flip_v = true
		$Icon.flip_h = true

func _physics_process(_delta):
	global_position += Vector2(1, 0).rotated(rotation) * bullet_velocity

func _on_body_entered(body):
	if body.is_in_group("environment"):
		queue_free()
