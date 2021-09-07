extends Control


export(NodePath) var DialogUI
export(NodePath) var DialogProfile
export(NodePath) var DialogText

var _dialog_ui : Control
var _dialog_profile : TextureRect
var _dialog_text : RichTextLabel

func _ready() -> void:
	_dialog_ui = get_node(DialogUI)
	_dialog_profile = get_node(DialogProfile)
	_dialog_text = get_node(DialogText)
	
	_dialog_ui.visible = false


func display_dialog(speaker_ref:DialogSpeakerRef, line:String) -> void:
	_dialog_ui.visible = true
	_dialog_profile.texture = speaker_ref.profile_pic
	_dialog_text.text = line


func close_dialog() -> void:
	_dialog_ui.visible = false
