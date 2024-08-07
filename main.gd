extends Node2D

var Bullet = preload("res://bullet.tscn")
const BULLET_SPEED := 600

func _ready() -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		shoot(get_global_mouse_position())

func shoot(target_position: Vector2) -> void:
	var bullet: RigidBody2D = Bullet.instantiate()
	bullet.position = $Player.position
	
	var direction: Vector2 = (target_position - bullet.position).normalized()
	bullet.linear_velocity = direction * BULLET_SPEED
	
	var angle: float = direction.angle()
	bullet.rotation = angle
	
	add_child(bullet)
