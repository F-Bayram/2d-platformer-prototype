extends PlayerState

func enter() -> void:
	animation_tree.set("parameters/Transition/transition_request", "idle")
	animation_tree.set("parameters/Idle/blend_position", \
		player_controller.velocity_component.h_direction)

func update(_delta: float) -> void:
	if Input.is_action_pressed("MoveLeft") or Input.is_action_pressed("MoveRight"):
		transitioned.emit(self, "PlayerMove")
	if Input.is_action_pressed("Action") and player_controller.is_on_floor():
		transitioned.emit(self, "PlayerJump")

func physics_update(_delta: float) -> void:
	player_controller.gravity_component.apply_gravity(player_controller)
	player_controller.velocity_component.move_y(player_controller)
	player_controller.move_and_slide()
