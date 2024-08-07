extends RigidBody2D

func _ready():
	gravity_scale = 0

func _integrate_forces(state):
	if linear_velocity != Vector2.ZERO:
		rotation = linear_velocity.angle()

func _process(delta):
	if not get_viewport_rect().has_point(global_position):
		queue_free()
