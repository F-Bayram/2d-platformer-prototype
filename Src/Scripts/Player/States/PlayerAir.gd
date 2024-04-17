extends PlayerState

func enter() -> void:
	animation_tree.set("parameters/Transition/transition_request", "jump")

func update(delta):
	if player_controller.is_on_floor() == true:
		var next_state_name = "PlayerIdle"
		if Input.is_action_pressed("MoveLeft") == true or \
			Input.is_action_pressed("MoveRight") == true:
			next_state_name = "PlayerMove"
		transitioned.emit(self, next_state_name)
	if Input.is_action_pressed("MoveUp") == true and \
		player_controller.player_data.waterfill > 0:
			transitioned.emit(self, "PlayerFly")

func physics_update(delta):
	player_controller.gravity_component.apply_gravity(player_controller)
	player_controller.velocity_component.move_x(player_controller, delta)
	player_controller.velocity_component.move_y(player_controller)
	player_controller.move_and_slide()
