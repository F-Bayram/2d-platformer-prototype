extends Node
class_name FlyComponent

@export var velocity_component: VelocityComponent

@export var sprite: Sprite2D
@export var water_vfx_active: bool = true
@export var player_data: PlayerData

@export var fly_acceleration: float = 64
@export var fly_velocity: float = 256

func _accelerate():
	velocity_component.v_velocity -= fly_acceleration
	if velocity_component.v_velocity < -fly_velocity:
		velocity_component.v_velocity = -fly_velocity

func _decrement_waterfill():
	player_data.waterfill = clamp(player_data.waterfill - 1, 0, 100)

func _apply_water_vfx():
	if sprite.material != null and water_vfx_active:
		sprite.material.set_shader_parameter("waterfill", player_data.waterfill)

func fly():
	_accelerate()
	_decrement_waterfill()
	_apply_water_vfx()
