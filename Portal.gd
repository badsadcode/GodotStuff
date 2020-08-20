#badsad Teleport
#You'll need to reorganize portal system that I presented in tutorial. 
#Add two portals to the scene. 
#For the first portal (i.e. named Portal_A) set Dest Node to Your other portal (i.e. Portal_B)
#For the second portal (i.e. named Portal_B) set Dest Node to Your other portal (i.e. Portal_A)

extends Node2D

var destination 
export(NodePath) var DestNode
onready var resp_coords = get_node(DestNode)
func _ready():
	
	destination = resp_coords.get_global_position()



func _on_Area2D_body_entered(body):
	if body.name == "Player" and !body.isTeleporting:
		body.isTeleporting = true
		body.set_position(destination)


func _on_Area2D_body_exited(body):
	if body.name == "Player" and body.isTeleporting:
		body.isTeleporting = false
		body.set_position(destination)
