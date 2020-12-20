extends Light2D

var playerinArea: bool = false
var player_id

func _ready() -> void:
	pass

func _physics_process(_delta):
	var space_state = get_world_2d().direct_space_state
	# use global coordinates, not local to node
	var result = space_state.intersect_ray(Vector2(position.x, position.y), get_node("/root/Game/Player").position)
	if result.size() == 0:
		pass #If enemy collided from behind
	elif result.collider.name == "Player" && playerinArea:
		print(str(result.collider.name) + " detected at " + str(result.collider.position))
		result.collider.position = result.collider.respawn
		$AudioStreamPlayer.play()
	pass

func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "Player":
		playerinArea = true
	pass

func _on_Area2D_body_exited(body: Node) -> void:
	if body.name == "Player":
		playerinArea = false
	pass
