extends Node


onready var BGSFX = get_node("BackGround Music")
onready var VicFX = get_node("VICTORY!")

func _ready() -> void:
	$Camera2D.make_current()
	print("start")
	$Player.respawn = Vector2(144,600)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	camera_location()
	pass

func camera_location() -> void:
	$Camera2D.position.x = int($Player.position.x / 1280)*1280
	$Camera2D.position.y = int($Player.position.y / 720)*720
	pass


func _on_AudioStreamPlayer_finished() -> void:
	if !VicFX.playing:
		BGSFX.play()
	elif VicFX.playing:
		VicFX.play()
	pass # Replace with function body.
