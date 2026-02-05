extends RigidBody2D
class_name ClackBall

@export var data : ClackBallData 

@export var mesh : MeshInstance2D
@export var collision : ClackBallCollider 
@export var hurt_area : ClackBallHurtArea

func _ready() -> void:
	mesh.set_size(data.ball_radius)
	collision.set_size(data.ball_radius)
	hurt_area.set_size(data.ball_radius)
	
	linear_velocity = _to_component_vector(data.launch_speed, 360 * randf())
	angular_velocity = data.spin_speed
	
func _to_component_vector(magnitude : float, angle : float):
	return Vector2(magnitude * cos(deg_to_rad(angle)), magnitude * sin(deg_to_rad(angle)))
	
func pause(paused : bool) -> void:
	if paused:
		process_mode = Node.PROCESS_MODE_DISABLED
	else:
		process_mode = Node.PROCESS_MODE_ALWAYS
