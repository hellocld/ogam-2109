class_name Character
extends KinematicBody

signal interacting

export(float) var Move_Speed = 1.0

var _move_dir : Vector3


func _physics_process(delta):
	# Only move if we're exploring, not during dialog
	if GameManager.state == GameManager.State.EXPLORATION:
		_handle_movement(delta)


func _handle_movement(delta):
	if _move_dir.length_squared() > 0:
		# update position
		move_and_slide(_move_dir.normalized() * Move_Speed, Vector3.UP)
		# update orientation
		global_transform = global_transform.looking_at(global_transform.origin + _move_dir, Vector3.UP)
		# clear the movement vector so it's ready for the next input event
		#_move_dir = Vector3.ZERO
