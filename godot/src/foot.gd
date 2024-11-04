extends Node3D

@export var spin_speed := 10.0

func _process(delta: float) -> void:
	rotate_y(spin_speed * delta)
