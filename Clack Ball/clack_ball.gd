extends RigidBody2D
class_name ClackBall

signal stats_changed(ball_data : ClackBallData)

@export var data : ClackBallData 

@export var mesh : MeshInstance2D
@export var collision : ClackBallCollider 
@export var hurt_area : ClackBallHurtArea
@export var health_text : RichTextLabel

var stats_label : StatsLabel

var weapon : Node2D

func _ready() -> void:
	mesh.set_size(data.ball_radius)
	collision.set_size(data.ball_radius)
	hurt_area.set_size(data.ball_radius)

	linear_velocity = _to_component_vector(data.launch_speed, 360 * randf())
	angular_velocity = data.attack_speed
	
	weapon = data.weapon.instantiate()
	weapon.position.y = -data.ball_radius
	add_child(weapon)
	
	stats_changed.emit(data)
	
func _to_component_vector(magnitude : float, angle : float):
	return Vector2(magnitude * cos(deg_to_rad(angle)), magnitude * sin(deg_to_rad(angle)))
	
func pause(paused : bool) -> void:
	if paused:
		process_mode = Node.PROCESS_MODE_DISABLED
	else:
		process_mode = Node.PROCESS_MODE_ALWAYS

func on_clank() -> void:
	angular_velocity = -data.attack_speed * (angular_velocity/abs(angular_velocity))
	
func damage(value : int) -> void:
	data.health -= value
	health_text.text = "[b]" + str(data.health)

func _on_clack_ball_hurt_area_area_entered(area: Area2D) -> void:
	if area is HitBoxArea and area != weapon.hit_box_area:
		damage(area.get_damage())

func set_stats(ball_name : String, ball_radius : float, ball_weight : float,
	ball_gravity : float, attack_speed : float, damage : int) -> void:
	data.name = ball_name
	data.ball_radius = ball_radius
	data.weight = ball_weight
	data.gravity = ball_gravity
	data.attack_speed = attack_speed
	data.damage = damage
	stats_changed.emit(data)

func set_radius(new_radius : float) -> void:
	data.ball_radius = new_radius
	stats_changed.emit(data)

func set_weight(new_weight : float) -> void:
	data.ball_weight = new_weight
	stats_changed.emit(data)
	
func set_gravity(new_gravity : float) -> void:
	data.ball_gravity = new_gravity
	stats_changed.emit(data)
	
func set_attack_speed(new_attack_speed : float) -> void:
	data.attack_speed = new_attack_speed
	stats_changed.emit(data)
	
func set_damage(new_damage : int) -> void:
	data.damage = new_damage
	stats_changed.emit(data)

func get_ball_name() -> String:
	return data.name


func _on_stats_changed(ball_data: ClackBallData) -> void:
	if stats_label:
		stats_label.update_stats(ball_data.name, ball_data.ball_radius, 
		ball_data.weight, ball_data.gravity, ball_data.attack_speed, ball_data.damage)
