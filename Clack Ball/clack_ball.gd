extends RigidBody2D
class_name ClackBall

@export var data : ClackBallData 

@export var mesh : MeshInstance2D
@export var collision : ClackBallCollider 
@export var hurt_area : ClackBallHurtArea
@export var health_text : RichTextLabel

var health : int

var weapon : Node2D

func _ready() -> void:
	mesh.set_size(data.ball_radius)
	collision.set_size(data.ball_radius)
	hurt_area.set_size(data.ball_radius)
	
	health = data.initial_health
	linear_velocity = _to_component_vector(data.launch_speed, 360 * randf())
	angular_velocity = data.initial_attack_speed
	
	weapon = data.weapon.instantiate()
	weapon.position.y = -data.ball_radius
	add_child(weapon)
	
func _to_component_vector(magnitude : float, angle : float):
	return Vector2(magnitude * cos(deg_to_rad(angle)), magnitude * sin(deg_to_rad(angle)))
	
func pause(paused : bool) -> void:
	if paused:
		process_mode = Node.PROCESS_MODE_DISABLED
	else:
		process_mode = Node.PROCESS_MODE_ALWAYS

func on_clank() -> void:
	print("before ", angular_velocity)
	print("expected ", -data.initial_attack_speed * (angular_velocity/abs(angular_velocity)))
	angular_velocity = -data.initial_attack_speed * (angular_velocity/abs(angular_velocity))
	print("current ", angular_velocity)
	
func damage(value : int) -> void:
	health -= value
	health_text.text = "[b]" + str(health)

func _on_clack_ball_hurt_area_area_entered(area: Area2D) -> void:
	if area is HitBoxArea and area != weapon.hit_box_area:
		damage(area.get_damage())
