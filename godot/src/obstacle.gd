extends StaticBody3D

var min_vel := 2.0
var max_vel := 8.0

func _ready() -> void:
	constant_angular_velocity.x = randf_range(min_vel, max_vel)
	constant_angular_velocity.y = randf_range(min_vel, max_vel)
	constant_angular_velocity.z = randf_range(min_vel, max_vel)

func _process(delta: float) -> void:
	for child in get_children():
		if child is CollisionShape3D:
			continue
		if child is Node3D:
			child.rotate_x(constant_angular_velocity.x * delta)
			child.rotate_y(constant_angular_velocity.y * delta)
			child.rotate_z(constant_angular_velocity.z * delta)
