extends Node

enum types{Green = 0, Blue = 1 , Red = 2}
export(types) var TYPE

const colors = ["Green", "Blue", "Red"]
const light = [
	Color("#32ff00"),
	Color("#05e5fc"),
	Color("#bf1010")
]
var current_color:String = "Green"

var state_dict: Dictionary = {false:"OFF", true: "ON"}
var state = false

var in_body = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button/AnimatedSprite.play("Green")
	$Door/AnimatedSprite.play("Green")
	$Button/Light2D.color = light[0]
	$Button/AnimatedSprite/Label.text = state_dict[state]
	$Door.visible = !state
	$Door/CollisionShape2D.disabled = state
	$Button/Light2D.visible = state
	pass

func _process(_delta: float) -> void:
	if current_color != colors[TYPE]:
		button_Door_type()
		pass
	pass

func button_Door_type():
	current_color = colors[TYPE]
	$Button/AnimatedSprite.play(current_color)
	$Door/AnimatedSprite.play(current_color)
	$Button/Light2D.color = light[TYPE]
	pass

func _on_Button_body_entered(_body: Node) -> void:
	if !in_body:
		in_body = true
		state = !state
		$Button/AnimatedSprite/Label.text = state_dict[state]
		$Door.visible = !state
		$Button/Light2D.visible = state
		$Door/CollisionShape2D.set_deferred("disabled", state)
		$AudioStreamPlayer.play()
	pass 

func _on_Button_body_exited(_body: Node) -> void:
	in_body = false
	pass 
