extends Node
class_name TiledetectorComponent

@export var player: CharacterBody2D
@export var player_width: int = 128
@export var detection_distance: int = 128

var tiles: Dictionary = {}

func destroy_tile(direction: String):
	var ray: Dictionary = tiles[direction]
	if ray.is_empty() == true:
		return
	
	var collider: TileMap = ray.collider
	if collider is TileMap == false:
		return
	
	var map_coords: Vector2i = collider.local_to_map(ray.position)
	var tile_layer: int = collider.get_layer_for_body_rid(ray["rid"])
	collider.erase_cell(tile_layer, map_coords)

func _physics_process(delta):
	var space_rid = player.get_world_2d().space
	var space_state = PhysicsServer2D.space_get_direct_state(space_rid)
	var from = Vector2(player.global_position.x + player_width * 0.5, player.global_position.y)
	
	var left_ray = PhysicsRayQueryParameters2D.create(from, \
		player.global_position + Vector2.LEFT * detection_distance)
	var right_ray = PhysicsRayQueryParameters2D.create(from, \
		player.global_position + Vector2.RIGHT * detection_distance)
	var up_ray = PhysicsRayQueryParameters2D.create(from, \
		player.global_position + Vector2.UP * detection_distance)
	var down_ray = PhysicsRayQueryParameters2D.create(from, \
		player.global_position + Vector2.DOWN * detection_distance)
	
	tiles["left"] = space_state.intersect_ray(left_ray)
	tiles["right"] = space_state.intersect_ray(right_ray)
	tiles["up"] = space_state.intersect_ray(up_ray)
	tiles["down"] = space_state.intersect_ray(down_ray)
