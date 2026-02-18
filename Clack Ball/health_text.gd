extends RichTextLabel
class_name HealthLabel

func _ready() -> void:
	global_position = get_parent().global_position - size/2

func _process(_delta: float) -> void:
	global_position = get_parent().global_position - size/2
