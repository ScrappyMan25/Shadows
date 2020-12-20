extends Area2D

var Green = Color("#32ff00")

func _ready() -> void:
	$Light2D.color = Green
	pass # Replace with function body.

func unSetCheckpoint():
	$AnimatedSprite.play("ReSet")
	$AnimatedSprite/Label.text = "?"
	$Light2D.visible = false
	pass


func _on_Area2D_body_entered(body: Node) -> void:
	body.setCheckpoint(self)
	$AnimatedSprite.play("Set")
	$AnimatedSprite/Label.text = "!"
	$Light2D.visible = true
	$AudioStreamPlayer.play()
	pass # Replace with function body.
