extends Node
class_name GravityComponent

@export var velocity_component: VelocityComponent
@export var gravity: float = 9.81
@export var gravity_active: bool = true

func apply_gravity(entity: CharacterBody2D):
	if gravity_active == false:
		return
	
	if entity.is_on_floor() == true:
		velocity_component.v_velocity = 0.0
	else:
		velocity_component.v_velocity += gravity
