class_name DialogSpeaker
extends Node

export(Util.dialog_speakers) var Name
export(NodePath) var SpeakerNode
export(Texture) var ProfilePic

func _ready() -> void:
	var ref = DialogSpeakerRef.new()
	ref.name = Name
	ref.speaker = get_node(SpeakerNode) as Spatial
	ref.profile_pic = ProfilePic
	DialogManager.register_speaker(Name, ref)
