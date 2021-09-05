extends Character


func _physics_process(delta: float) -> void:
	_move_dir.z = Input.get_action_strength("char_move_down") - Input.get_action_strength("char_move_up")
	_move_dir.x = Input.get_action_strength("char_move_right") - Input.get_action_strength("char_move_left")
	._physics_process(delta)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("char_interact"):
		print_debug("Player interacting...")
		emit_signal("interacting")
