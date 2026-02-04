extends RigidBody2D
class_name ClackBall

@export var ball_radius := 30.0
@export var weight := 1.0
@export var gravity := 1.0
@export var launch_speed := 200.0
@export var spin_speed := 10.0


@export var clack_ball_mesh : MeshInstance2D
@export var clack_ball_collision : ClackBallCollider 
@export var clack_ball_hurt_area : ClackBallHurtArea

func _ready() -> void:
	clack_ball_mesh.set_size(ball_radius)
	clack_ball_collision.set_size(ball_radius)
	clack_ball_hurt_area.set_size(ball_radius)
	
	linear_velocity = _to_component_vector(launch_speed, 360 * randf())
	angular_velocity = spin_speed
	
func _to_component_vector(magnitude : float, angle : float):
	return Vector2(magnitude * cos(deg_to_rad(angle)), magnitude * sin(deg_to_rad(angle)))
	
func pause(paused : bool) -> void:
	if paused:
		process_mode = Node.PROCESS_MODE_DISABLED
	else:
		process_mode = Node.PROCESS_MODE_ALWAYS
