extends Node
class_name AbsorbComponent

@export var entity: CharacterBody2D
@export var absorb_vfx_active: bool = true
@export var player_data: PlayerData
@export var sprite: Sprite2D

func absorb() -> void:
	player_data.waterfill = clamp(player_data.waterfill + 1, 0, 100)
	if sprite != null and absorb_vfx_active == true:
		sprite.material.set_shader_parameter("waterfill", player_data.waterfill)
