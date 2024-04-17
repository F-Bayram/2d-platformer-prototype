extends PlayerState

func enter() -> void:
	animation_tree.set("parameters/Transition/transition_request", "jump")

func physics_update(delta):
	player_controller.jump_component.jump(player_controller)
	player_controller.velocity_component.move_x(player_controller, delta)
	player_controller.velocity_component.move_y(player_controller)
	player_controller.move_and_slide()
	transitioned.emit(self, "PlayerAir")
