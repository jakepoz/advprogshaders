extends CharacterBody2D


var speed = 5
var lastdir: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("stand_down")

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
	
	if dir.length() > 0:
		if dir.x > 0:
			$AnimatedSprite2D.play("walk_right")
			$AnimatedSprite2D.flip_h = false
		elif dir.x < 0:
			$AnimatedSprite2D.play("walk_right")
			$AnimatedSprite2D.flip_h = true
		elif dir.y > 0:
			$AnimatedSprite2D.play("walk_down")
			$AnimatedSprite2D.flip_h = false
		elif dir.y < 0:
			$AnimatedSprite2D.play("walk_up")
			$AnimatedSprite2D.flip_h = false
	else:
		if lastdir.x > 0:
			$AnimatedSprite2D.play("stand_right")
			$AnimatedSprite2D.flip_h = false
		elif lastdir.x < 0:
			$AnimatedSprite2D.play("stand_right")
			$AnimatedSprite2D.flip_h = true
		elif lastdir.y > 0:
			$AnimatedSprite2D.play("stand_down")
			$AnimatedSprite2D.flip_h = false
		elif lastdir.y < 0:
			$AnimatedSprite2D.play("stand_up")
			$AnimatedSprite2D.flip_h = false 
		
	lastdir = dir

