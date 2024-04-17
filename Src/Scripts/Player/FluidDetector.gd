extends Node
class_name FluidDetector

var fluid_detected: bool = false

func _on_body_entered(body):
	fluid_detected = true

func _on_body_exited(body):
	fluid_detected = false
