extends Node3D
signal finished

func _on_finish_area_entered(area: Area3D) -> void:
	emit_signal("finished")


func _on_finish_body_entered(body: Node3D) -> void:
	emit_signal("finished")
