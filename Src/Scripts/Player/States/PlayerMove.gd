extends PlayerState

func enter() -> void:
	animation_tree.set("parameters/Transition/transition_request", "walk")

func update(_delta) -> void:
	sound_player.play("dirt_walk")
	
	animation_tree.set("parameters/Walk/blend_position", \
		player_controller.velocity_component.h_direction)
	
	if is_zero_approx(player_controller.velocity_component.h_velocity) == true:
		transitioned.emit(self, "PlayerIdle")
	if Input.is_action_pressed("Action") and player_controller.is_on_floor():
		transitioned.emit(self, "PlayerJump")

func physics_update(delta) -> void:
	player_controller.gravity_component.apply_gravity(player_controller)
	player_controller.velocity_component.move_x(player_controller, delta)
	player_controller.velocity_component.move_y(player_controller)
	player_controller.move_and_slide()
