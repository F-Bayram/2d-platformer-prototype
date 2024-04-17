extends Control

@onready var hp_label = $VBoxContainer/MarginContainer2/HPLabel
@onready var waterfill_label = $VBoxContainer/MarginContainer/WaterfillLabel
@onready var angle_label = $VBoxContainer/MarginContainer3/AngleLabel
@onready var collision_label = $VBoxContainer/MarginContainer4/CollisionLabel
@onready var velocity_label = $VBoxContainer/MarginContainer5/VelocityLabel
@onready var state_label = $VBoxContainer/MarginContainer6/StateLabel

@export var player_data : PlayerData
@export var player: PlayerController

func _process(delta):
	hp_label.text = "HP: " + str(player_data.hp)
	waterfill_label.text = "Waterfill: " + str(player_data.waterfill)
	angle_label.text = "Angle: " + str(player_data.angle)
	collision_label.text = "Collision: " + player_data.collision
	velocity_label.text = "Velocity: (%s, %s)" % \
		[str(round(player.velocity.x)), str(round(player.velocity.y))]
	state_label.text = "State: " + player.state_machine.current_state.name.replace("Player", "")
