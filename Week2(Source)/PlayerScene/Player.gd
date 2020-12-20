extends KinematicBody2D

var respawn: Vector2 = Vector2(1952, 1280)
var checkpoint: Node = null

export (int) var speed = 200

var velocity = Vector2()
var rotation_dir = 0

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
	pass

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		pass
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		pass
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		pass
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		pass
	if Input.is_action_just_pressed("ui_focus_next"):
		$ColorPicker.visible = !$ColorPicker.visible
		pass
	velocity = velocity.normalized() * speed
	pass

func setCheckpoint(body: Node):
	if checkpoint != null:
		checkpoint.unSetCheckpoint()
	checkpoint = body
	respawn = body.position
	pass

func _on_ColorPicker_color_changed(color: Color) -> void:
	$Light2D.color = color
	pass	
