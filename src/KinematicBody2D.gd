extends KinematicBody2D

#Vector2() is an object that contains the x and y motions. Vector2(x, y) 
var motion = Vector2() #contians the motion of the character. Now has access to motion.x and motion.y
const UP = Vector2(0, -1)
const MAX_SPEED = 400
const ACCELERATION = 10
const GRAVITY = 35
const JUMP_HEIGHT = -650

func _physics_process(delta):
	motion.y += GRAVITY #for every frame it ADDS 10 instead of hard coding 10. This allows for realistic reaction of gravity,
	var friction = false
	if Input.is_action_pressed("ui_right"): 
		#min function represents positive x axis value.
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED) #Dont do anything if motion is less than MAX_SPEED, but if it becomes more than MAX_SPEED then have motion.x equal MAX_SPEED.
		#accessing child node would be with $ OR get_node("sprite1") to make it into variable.
		$Sprite.flip_h = false #flip_h is to have the player face opposite direction when key is pressed.
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		#max function represents positive x axis value.
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		motion.x = lerp(motion.x, 0, 0.1)
		$Sprite.play("Idle")
		friction = true
	#on the ground
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"): 
			motion.y = JUMP_HEIGHT
		if friction == true: 
			motion.x = lerp(motion.x, 0, 0.2)
	#in the air
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friction == true: 
			motion.x = lerp(motion.x, 0, 0.05)
		
	#docs mention 2nd argument of func move_and_slide for allowing jump in vector. Update motion with the return of the whole functon to stop from continuously adding gravity.
	motion = move_and_slide(motion, UP) 
	print(motion.y)
	
