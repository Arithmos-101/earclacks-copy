extends RichTextLabel
class_name StatsLabel

func update_stats(ball_name : String, ball_radius : float, ball_weight : float,
	ball_gravity : float, attack_speed : float) -> void:
	text = ball_name + " stats:\n" +\
			"Radius: " + str(ball_radius) +\
			"Weight: " + str(ball_weight) +\
			"Gravity: " + str(ball_gravity) +\
			"Attack Speed: " + str(attack_speed)
