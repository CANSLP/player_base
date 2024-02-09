extends Node3D

var size

var mat_on
var mat_off

func _ready():
	size = 1
	mat_on = preload("res://materials/neutral_on.tres")
	mat_off = preload("res://materials/neutral_off.tres")
	$body.material = mat_off

func _process(delta):
	size += (1-size)*0.5
	$body.scale = Vector3(1,1,1)*size
	$body.position.y = sin(Time.get_ticks_msec()*0.0025)*0.1

#called when clicked
func _clicked(player: Node):
	size = 0.75

#called when hovered over
func _target(player: Node):
	$body.material = mat_on

#called when no longer hovered over
func _untarget(player: Node):
	$body.material = mat_off
