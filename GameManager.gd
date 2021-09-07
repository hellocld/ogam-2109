extends Node


enum State {
	MAIN_MENU,
	EXPLORATION,
	DIALOG
}
var state = State.EXPLORATION

var _player : PlayerCharacter


func _ready() -> void:
	# Hide the damn cursor
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func get_state() -> int:
	return state


func set_state(new_state:int) -> void:
	state = new_state


func get_player() -> PlayerCharacter:
	return _player


func register_player(player : PlayerCharacter) -> void:
	_player = player
