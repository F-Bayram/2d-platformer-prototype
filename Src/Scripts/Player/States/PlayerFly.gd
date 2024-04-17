extends PlayerState

@export var waterjump_particle: GPUParticles2D

func enter() -> void:
	animation_tree.set("parameters/Transition/transition_request", "jump")

func update(delta) -> void:
	waterjump_particle.emitting = true
	
	if player_controller.is_on_floor() == false and \
		player_controller.player_data.waterfill > 0 and \
		Input.is_action_pressed("MoveUp") == true:
		return
	
	
	if player_controller.is_on_floor() == true:
		var next_state_name = "PlayerIdle"
		if Input.is_action_pressed("MoveLeft") or Input.is_action_pressed("MoveRight"):
			next_state_name = "PlayerMove"
		transitioned.emit(self, next_state_name)
	else:
		transitioned.emit(self, "PlayerAir")

func physics_update(delta) -> void:
	player_controller.fly_component.fly()
	player_controller.velocity_component.move_x(player_controller, delta)
	player_controller.velocity_component.move_y(player_controller)
	player_controller.move_and_slide()
	player_controller.gravity_component.apply_gravity(player_controller)
