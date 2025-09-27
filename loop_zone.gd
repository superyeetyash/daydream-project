extends Area2D

signal player_loop

func _ready() -> void:
	# Make sure the Area2D can detect bodies
	monitoring = true
	# Connect the body_entered signal to handle when player enters the loop zone
	body_entered.connect(_on_body_entered)
	print("Loop zone is ready and monitoring")

func _on_body_entered(body: Node2D) -> void:
	# Check if the body that entered is the player
	print("Body entered loop zone: ", body.name)
	if body is CharacterBody2D and body.name == "player":
		print("Player reached the loop zone! Teleporting to start...")
		player_loop.emit()
		# Teleport player back to the starting position
		var player = body as CharacterBody2D
		# Reset player position to near the beginning of the level (around the spawn point)
		player.position = Vector2(20000, 2)  # Teleport near player spawn
		print("Player teleported back to start position: ", player.position)
