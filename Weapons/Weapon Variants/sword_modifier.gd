extends WeaponModifier

func on_attack():
	get_parent().get_parent().set_damage(get_parent().get_parent().data.damage+1)
