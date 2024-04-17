extends Node
class_name JumpComponent

@export var velocity_component: VelocityComponent
@export var jump_height: int = 964

var is_jump_key_pressed: bool = false

func _update_input():
	is_jump_key_pressed = Input.is_action_just_pressed("Action")

func _process(delta):
	_update_input()

func jump(entity: CharacterBody2D):
	velocity_component.v_velocity += -jump_height
