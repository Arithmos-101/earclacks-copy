extends Node2D
class_name Weapon

@export var clack_cooldown_timer : Timer
# If you want to make this changable per clack ball, you need to
# move the clack_cooldown_timer.is_stopped() out of the if statement
# and into the on_clank thing
@export var clack_cooldown := 0.1
@export var weapon_mesh : MeshInstance2D
@export var hit_box_area : Area2D
@export var initial_damage := 1
@export var weapon_modifer : WeaponModifer

var damage = initial_damage

func _ready() -> void:
	clack_cooldown_timer.wait_time = clack_cooldown

func _on_hit_box_area_area_entered(area: Area2D) -> void:
	if area is ClackBallHurtArea and area != get_parent().hurt_area:
		if weapon_modifer:
			weapon_modifer.on_attack()
	if area is HitBoxArea && clack_cooldown_timer.is_stopped():
		area.on_clank()
		on_clank()

func on_clank():
	clack_cooldown_timer.start()
	get_parent().on_clank()
