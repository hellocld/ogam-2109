class_name PlayerCharacter
extends Character


var _interactable_body:Spatial


func _ready() -> void:
	GameManager.register_player(self)


func _physics_process(delta: float) -> void:
	_move_dir.z = Input.get_action_strength("char_move_down") - Input.get_action_strength("char_move_up")
	_move_dir.x = Input.get_action_strength("char_move_right") - Input.get_action_strength("char_move_left")
	._physics_process(delta)


func _unhandled_input(event: InputEvent) -> void:
	if GameManager.get_state() != GameManager.State.EXPLORATION:
		return
	if event.is_action_pressed("char_interact"):
		print_debug("Player interacting...")
		if _interactable_body && _interactable_body.has_signal(Util.sig_interacted_with):
			_interactable_body.emit_signal(Util.sig_interacted_with)


func _on_InteractArea_body_entered(body: Node) -> void:
	if body.has_signal(Util.sig_interacted_with):
		print_debug("Interactable %s detected" % body.name)
		_interactable_body = body


func _on_InteractArea_body_exited(body: Node) -> void:
	if _interactable_body == body:
		print_debug("Removing interactable %s" % body.name)
		_interactable_body = null
