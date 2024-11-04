extends Area3D

signal bump

@export var playerSpeed := 11.0

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		position.x += playerSpeed * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= playerSpeed * delta
	position.x = clamp(position.x, -5.0, 5.0)


func _on_area_entered(area: Area3D) -> void:
	emit_signal("bump")

func _on_body_entered(body: Node3D) -> void:
	emit_signal("bump")
