extends Node2D

var state: bool = false


func _on_Area2D_body_entered(_body: Node) -> void:
	if !state:
		$Area2D/LightOccluder2D/Light2D.visible = true
		state = true
		get_node("/root/Game/BackGround Music").stop()
		get_node("/root/Game/VICTORY!").play()
	pass # Replace with function body.
