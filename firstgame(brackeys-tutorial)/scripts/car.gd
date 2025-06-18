extends Node2D

var damping = 100
@onready var body: RigidBody2D = $Body
@onready var wheel_left: RigidBody2D = $WheelLeft
@onready var wheel_right: RigidBody2D = $WheelRight
@onready var car: Node2D = $"."

func _physics_process(delta):
	var drive_force = 2000.0
	var brake_force = 200.0
	var input = Input.get_action_strength("car_right") - Input.get_action_strength("car_left")
	if input != 0:
		wheel_left.apply_torque_impulse(input * drive_force * delta)
		wheel_right.apply_torque_impulse(input * drive_force * delta)
	
	var tilt= Input.get_action_strength("car_up")- Input.get_action_strength("car_down")
	var left_wheel_pos=wheel_left.global_position
	var right_wheel_pos=wheel_right.global_position
	var torque_strength=90000
	if tilt!=0:
		body.apply_torque_impulse(tilt * torque_strength * delta)
	
	
