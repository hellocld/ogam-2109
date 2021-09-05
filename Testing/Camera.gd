extends Camera


export(NodePath) var TargetNode

var _target:Spatial
var _offset:Vector3


func _ready():
	_offset = global_transform.origin
	if TargetNode:
		_target = get_node(TargetNode)


func _process(_delta):
	if !_target:
		return
	global_transform.origin = _target.global_transform.origin + _offset
