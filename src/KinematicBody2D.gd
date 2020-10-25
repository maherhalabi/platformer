extends KinematicBody2D

#Vector2() is an object that contains the x and y motions. Vector2(x, y) 
var motion = Vector2() #contians the motion of the character. Now has access to motion.x and motion.y
const UP = Vector2(0, -1)
const SPEED = 200
const GRAVITY = 35
var JUMP_HEIGHT = -650

func _physics_process(delta):
	motion.y += GRAVITY #for every frame it ADDS 10 instead of hard coding 10. This allows for realistic reaction of gravity,
	
	if Input.is_action_pressed("ui_right"): 
		motion.x = SPEED
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		
	else:
		motion.x = 0
		
	if is_on_floor():
		print("On floor.")
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT 
			
#docs mention 2nd argument of func move_and_slide for allowing jump in vector. Update motion with the return of the whole functon to stop from continuously adding gravity.
	motion = move_and_slide(motion, UP) 
	print(motion)
