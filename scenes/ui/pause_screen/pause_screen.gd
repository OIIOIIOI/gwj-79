class_name PauseScreen
extends CanvasLayer


@onready var resume_button: Button = $%ResumeButton
@onready var quit_button: Button = $%QuitButton


func _ready() -> void:
	get_tree().paused = true

	resume_button.pressed.connect(on_resume_pressed)
	quit_button.pressed.connect(on_quit_pressed)

	resume_button.grab_focus()


func on_resume_pressed():
	close()


func on_quit_pressed():
	SceneTransition.transition_to_title()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"pause"):
		close()
		get_tree().root.set_input_as_handled()


func close():
	get_tree().paused = false
	queue_free()
