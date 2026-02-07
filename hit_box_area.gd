extends Area2D
class_name HitBoxArea

func get_damage() -> int:
	# TODO: Change get_parent into something more reliable
	return get_parent().damage

func on_clank() -> void:
	get_parent().on_clank()
