extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	monitoring = true


func _area_entered(area):
	print(area)
