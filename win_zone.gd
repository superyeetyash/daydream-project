extends Area2D

signal player_won

func _ready() -> void:
	# Make sure the Area2D can detect bodies
	monitoring = true
	# Connect the body_entered signal to handle when player enters the zone
	body_entered.connect(_on_body_entered)
	print("Win zone is ready and monitoring")

func _on_body_entered(body: Node2D) -> void:
	# Check if the body that entered is the player
	print("Body entered win zone: ", body.name)
	if body is CharacterBody2D and body.name == "player":
		print("Player reached the win zone!")
		player_won.emit()
		# Change scene to winning screen
		get_tree().change_scene_to_file("res://win_screen.tscn")