class_name DialogTrigger
extends Node

export(Resource) var Dialog_Set


func _on_interacted_with() -> void:
	DialogManager.initiate_dialog(Dialog_Set)
