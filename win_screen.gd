extends Control

func _ready() -> void:
	# Connect button signals
	$VBoxContainer/RestartButton.pressed.connect(_on_restart_pressed)
	$VBoxContainer/QuitButton.pressed.connect(_on_quit_pressed)
	
	# Make the labels larger and more visible
	var win_label = $VBoxContainer/WinLabel
	win_label.add_theme_font_size_override("font_size", 32)
	
	var sub_label = $VBoxContainer/SubLabel
	sub_label.add_theme_font_size_override("font_size", 18)

func _on_restart_pressed() -> void:
	# Return to the main game scene
	get_tree().change_scene_to_file("res://main.tscn")

func _on_quit_pressed() -> void:
	# Quit the game
	get_tree().quit()