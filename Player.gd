extends KinematicBody2D


var speed = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var dir = Vector2.ZERO
	
	if Input.is_action_pressed("moveup"):
		dir.y = -1
	elif Input.is_action_pressed("movedown"):
		dir.y = 1	
	elif Input.is_action_pressed("moveleft"):
		dir.x = -1	
	elif Input.is_action_pressed("moveright"):
		dir.x = 1		

	move_and_collide(dir * speed)

