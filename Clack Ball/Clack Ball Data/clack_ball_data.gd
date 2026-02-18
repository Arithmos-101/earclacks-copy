extends Resource
class_name ClackBallData

@export_group("Ball info")
@export var name : String

@export_group("Ball Stats")
@export var ball_radius := 30.0
@export var weight := 1.0
@export var gravity := 1.0
@export var launch_speed := 200.0
@export var health := 100

@export_group("Weapon Data")
@export var weapon : PackedScene
@export var damage := 1
@export var attack_speed := 5.0
@export var hit_freeze := 0.0
