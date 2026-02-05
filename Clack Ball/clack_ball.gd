extends RigidBody2D
class_name ClackBall

@export var clack_ball_data : ClackBallData 

@export var clack_ball_mesh : MeshInstance2D
@export var clack_ball_collision : ClackBallCollider 
@export var clack_ball_hurt_area : ClackBallHurtArea

func _ready() -> void:
	clack_ball_mesh.set_size(clack_ball_data.ball_radius)
	clack_ball_collision.set_size(clack_ball_data.ball_radius)
	clack_ball_hurt_area.set_size(clack_ball_data.ball_radius)
	
	linear_velocity = _to_component_vector(clack_ball_data.launch_speed, 360 * randf())
	angular_velocity = clack_ball_data.spin_speed
	
func _to_component_vector(magnitude : float, angle : float):
	return Vector2(magnitude * cos(deg_to_rad(angle)), magnitude * sin(deg_to_rad(angle)))
	
func pause(paused : bool) -> void:
	if paused:
		process_mode = Node.PROCESS_MODE_DISABLED
	else:
		process_mode = Node.PROCESS_MODE_ALWAYS
