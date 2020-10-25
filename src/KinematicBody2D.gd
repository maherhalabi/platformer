extends KinematicBody2D

#Vector2() is an object that contains the x and y motions. 
var motion = Vector2() #contians the motion of the character. Now has access to motion.x and motion.y
var speed = 200
var gravity = 40

func _physics_process(delta):
	motion.y = gravity
	
	if Input.is_action_pressed("ui_right"): 
		motion.x = speed
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		
	else:
		motion.x = 0
		
	motion = move_and_slide(motion)
