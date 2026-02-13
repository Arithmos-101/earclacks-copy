extends RichTextLabel
class_name StatsLabel

func update_stats(ball_name : String, ball_radius : float, ball_weight : float,
	ball_gravity : float, attack_speed : float, damage : int) -> void:
	text = ball_name + " stats:\n" +\
			"Radius: " + str(ball_radius) +\
			"\nWeight: " + str(ball_weight) +\
			"\nGravity: " + str(ball_gravity) +\
			"\nAttack Speed: " + str(attack_speed) +\
			"\nDamage: " + str(damage)
