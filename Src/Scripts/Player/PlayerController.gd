extends CharacterBody2D
class_name PlayerController

@export var absorb_component: AbsorbComponent
@export var velocity_component: VelocityComponent
@export var jump_component: JumpComponent
@export var gravity_component: GravityComponent
@export var fly_component: FlyComponent

@export var state_machine: StateMachine

@onready var waterjump_particle = $WaterjumpParticle

@export var player_data : PlayerData

@onready var sound_anim_player = $SoundAnimPlayer
@onready var animation_tree = $AnimationTree

@onready var fluid_detector: FluidDetector = $FluidDetector
@onready var tileselector_component: TileselectorComponent = $Components/TileselectorComponent

func handle_water_absorb():
	if fluid_detector.fluid_detected == false:
		return
	absorb_component.absorb()

func _process(delta):
	handle_water_absorb()

#func climbable_tile_found():
	#var space_state = get_world_2d().direct_space_state
	## use global coordinates, not local to node
	#var ray_pos = global_position + Vector2.UP * 64
	#var query = PhysicsRayQueryParameters2D.create(ray_pos, \
		#ray_pos + Vector2.RIGHT * dir * 128)
	#var result: Dictionary = space_state.intersect_ray(query)
	#if result.is_empty() == false:
		#player_data.collision = str(PhysicsServer2D.body_get_collision_layer(result.get("rid")))
	#else:
		#player_data.collision = "None"
