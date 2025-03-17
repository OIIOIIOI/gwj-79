class_name Warp
extends Area3D


@export var destination: GameEnums.WARP_LOCATION


@onready var timer: Timer = $Timer


func _ready() -> void:
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)
	timer.timeout.connect(on_timer_timeout)


func on_body_entered(body: Node3D) -> void:
	if body is Beast:
		print("Starting timer")
		timer.start()


func on_body_exited(body: Node3D) -> void:
	if body is Beast:
		print("Stopping timer")
		timer.stop()


func on_timer_timeout() -> void:
	print("TIMEOUT - Warp to ", destination)
	SceneTransition.transition_to_location(destination)
