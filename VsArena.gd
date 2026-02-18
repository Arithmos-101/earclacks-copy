extends Control

signal paused(set_paused : bool)

@export var clack_ball_spawn_1 : Marker2D
@export var clack_ball_spawn_2 : Marker2D
@export var vs_label : RichTextLabel
@export var left_stat_label : StatsLabel
@export var right_stat_label : StatsLabel


var default_clack_ball = preload("res://Clack Ball/clack_ball.tscn")
var balls : Array[ClackBall]
var is_paused := false

func _ready() -> void:
	_spawn_balls()
	pause()
	
func _spawn_balls() -> void:
	var clack_ball = default_clack_ball.instantiate()
	clack_ball.position = clack_ball_spawn_1.position
	clack_ball.data = load("res://Clack Ball/Clack Ball Data/dagger_ball_data.tres").duplicate()
	clack_ball.stats_label = left_stat_label
	clack_ball.attacked.connect(on_attack)
	add_child(clack_ball)
	balls.append(clack_ball)
	
	clack_ball = default_clack_ball.instantiate()
	clack_ball.position = clack_ball_spawn_2.position
	clack_ball.data = load("res://Clack Ball/Clack Ball Data/sword_ball_data.tres").duplicate()
	clack_ball.stats_label = right_stat_label
	clack_ball.attacked.connect(on_attack)
	add_child(clack_ball)
	balls.append(clack_ball)
	
	vs_label.text = balls[0].get_ball_name() + " vs " + balls[1].get_ball_name()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("space"):
		pause()

func pause():
	emit_signal("paused", !is_paused)

func _on_paused(set_paused: bool) -> void:
	for ball in balls:
		ball.pause(set_paused)
	is_paused = !is_paused

func on_attack(freeze_time : float) -> void:
	if freeze_time < 0.01:
		return
	for ball in balls:
		ball.pause(true)
	await get_tree().create_timer(freeze_time).timeout
	for ball in balls:
		ball.pause(false)
