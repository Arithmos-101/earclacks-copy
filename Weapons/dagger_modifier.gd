extends WeaponModifier

func on_attack():
	get_parent().get_parent().set_attack_speed(get_parent().get_parent().data.attack_speed+0.5)
