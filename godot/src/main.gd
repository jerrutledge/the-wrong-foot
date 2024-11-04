extends Node3D

@onready var level: Node3D = $Level
@onready var panel: Panel = $UI/Panel
@onready var player: Area3D = $Player
@onready var camera_3d: Camera3D = $Camera3D
@onready var animation_player: AnimationPlayer = $Camera3D/AnimationPlayer

var level_speed : float = 0.0
@export var max_speed := 110.0
@export var accel := 5.0
@export var bump_speed := -3.0

@export var started := false
var finished : bool = false

func _ready() -> void:
	animation_player.play("get_ready")

func _process(_delta):
	if !started:
		return
	if !finished:
		level.position.y -= level_speed * _delta
		# apply acceleration
		level_speed += clamp(accel * _delta, bump_speed, max_speed)
	else:
		player.position.y += level_speed * _delta
		camera_3d.look_at(player.position)

func bump():
	level_speed = bump_speed

func _on_level_finished() -> void:
	finished = true
	animation_player.play("finished")
	print("Level finished: ", panel.get_time_formatted())
