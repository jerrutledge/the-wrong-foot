extends Node3D

@onready var level: Node3D = $Level
@onready var panel: Panel = $UI/Panel
@export var level_speed : float = 6.0
var finished : bool = false

func _process(_delta):
	if !finished:
		level.position.y -= level_speed


func _on_level_finished() -> void:
	finished = true
	print("Level finished: ", panel.get_time_formatted())
