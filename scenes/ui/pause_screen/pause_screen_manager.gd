extends Node


@export var pause_scene: PackedScene


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"pause"):
		var pause_instance = pause_scene.instantiate() as PauseScreen
		add_child(pause_instance)
		get_tree().root.set_input_as_handled()
