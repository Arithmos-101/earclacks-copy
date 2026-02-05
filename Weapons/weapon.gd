extends Node2D
class_name Weapon

@export var weapon_mesh : MeshInstance2D
@export var hit_box_area : Area2D
@export var initial_damage := 1
@export var weapon_modifer : WeaponModifer

var damage = initial_damage

func _on_hit_box_area_area_entered(area: Area2D) -> void:
	if area is ClackBallHurtArea and area != get_parent().hurt_area:
		if weapon_modifer:
			weapon_modifer.on_attack()
