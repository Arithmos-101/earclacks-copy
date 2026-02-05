extends Resource
class_name ClackBallData

@export var ball_radius := 30.0
@export var weight := 1.0
@export var gravity := 1.0
@export var launch_speed := 200.0
@export var initial_health := 100

@export_group("Weapon Data")
@export var weapon : PackedScene
@export var attack_speed := 5.0
