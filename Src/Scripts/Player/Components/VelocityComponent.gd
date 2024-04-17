extends Node
class_name VelocityComponent

@export var h_max_velocity: int = 512
@export var h_acceleration: int = 256 # pixel per second -> moving horizontally
@export var h_deacceleration: int = 256

var v_velocity: float = 0

var h_velocity: float = 0
var h_direction: int = 1 # 0: left, 1: right
var t: float = 0.0
var is_movement_key_pressed: bool = false

func _accelerate(delta: float):
	h_velocity = lerpf(h_velocity, h_max_velocity * h_direction, t)
	t = clampf(t + delta * h_acceleration * 0.01, 0.0, 1.0)

func _deaccelerate(delta: float):
	h_velocity = lerpf(0, h_velocity, t)
	t = clampf(t - h_deacceleration * delta * 0.01, 0.0, 1.0)

func _apply_velocity_x(entity: CharacterBody2D):
	entity.velocity.x = h_velocity

func _apply_velocity_y(entity: CharacterBody2D):
	entity.velocity.y = v_velocity

func move_x(entity: CharacterBody2D, delta: float):
	if is_movement_key_pressed == true:
		_accelerate(delta)
	else:
		_deaccelerate(delta)
	_apply_velocity_x(entity)

func move_y(entity: CharacterBody2D):
	_apply_velocity_y(entity)

func _update_input():
	if Input.is_action_pressed("MoveLeft"):
		h_direction = -1
		is_movement_key_pressed = true
	elif Input.is_action_pressed("MoveRight"):
		h_direction = 1
		is_movement_key_pressed = true
	else:
		is_movement_key_pressed = false

func _process(delta):
	_update_input()
