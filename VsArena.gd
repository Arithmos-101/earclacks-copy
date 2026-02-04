extends Node2D

signal paused(paused : bool)

@export var clack_ball_spawn_1 : Node2D
@export var clack_ball_spawn_2 : Node2D

var default_clack_ball = preload("res://Clack Ball/clack_ball.tscn")
var balls : Array[ClackBall]
var is_paused := false

func _ready() -> void:
	_spawn_balls()
	pause()
	
func _spawn_balls() -> void:
	var spawns = [clack_ball_spawn_1, clack_ball_spawn_2]
	var clack_balls = [default_clack_ball.instantiate(), default_clack_ball.instantiate()]
	for i in spawns.size():
		clack_balls[i].position = spawns[i].position
		add_child(clack_balls[i])
		balls.append(clack_balls[i])

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("space"):
		pause()

func pause():
	emit_signal("paused", !is_paused)

func _on_paused(paused: bool) -> void:
	for ball in balls:
		ball.pause(paused)
	is_paused = !is_paused
