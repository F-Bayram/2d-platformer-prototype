extends Node
class_name StateMachine

@export var current_state: State
var states: Dictionary = {}

func _ready():
	if current_state == null and get_child_count() > 0:
		current_state = get_child(0)
	for state: State in get_children():
		states[state.name] = state
		state.transitioned.connect(on_state_transitioned)
	if current_state != null:
		current_state.enter()

func _process(delta):
	if current_state != null:
		current_state.update(delta)

func _physics_process(delta):
	if current_state != null:
		current_state.physics_update(delta)

func on_state_transitioned(state: State, new_state_name: String):
	if state != current_state:
		return
	
	var new_state: State = states[new_state_name]
	
	if current_state == null or new_state == null:
		return
	
	current_state.exit()
	new_state.enter()
	current_state = states[new_state_name]
