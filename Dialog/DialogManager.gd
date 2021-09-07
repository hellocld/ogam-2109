extends Node

signal dialog_finished

var speakers:Dictionary

var current_script:DialogSet
var script_line := 0

func _unhandled_input(event: InputEvent) -> void:
	# Any input caught here is for the dialog system
	if event.is_action_pressed("ui_accept") && GameManager.State.DIALOG:
		set_next_dialog()


func register_speaker(name:int, ref:DialogSpeakerRef) -> void:
	"""
	Register a DialogSpeakerRef that can speak using the Dialog System. Called 
	on ready by DialogSpeaker.
	"""
	if !speakers.has(name):
		speakers[name] = ref


func clear_speaker_registry() -> void:
	speakers.clear()


func initiate_dialog(script:DialogSet) -> void:
	# Set game manager state to Dialog
	GameManager.set_state(GameManager.State.DIALOG)
	current_script = script
	script_line = 0


func set_next_dialog() -> void:
	if script_line < current_script.Dialog.size():
		var line = current_script.Dialog[script_line] as DialogLine
		UIManager.display_dialog(speakers[line.Speaker], line.Line)
		script_line += 1
	else:
		# dialog script is finished!
		UIManager.close_dialog()
		GameManager.set_state(GameManager.State.EXPLORATION)
		emit_signal("dialog_finished")


func increment_dialog() -> void:
	script_line += 1
	set_next_dialog()


