extends Area2D

signal player_won

func _ready() -> void:
	# Connect the body_entered signal to handle when player enters the zone
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	# Check if the body that entered is the player
	if body.name == "player":
		print("Player reached the win zone!")
		player_won.emit()
		# Change scene to winning screen
		get_tree().change_scene_to_file("res://win_screen.tscn")