extends KinematicBody2D

export(int) var speed = 50
var movedir = Vector2(0, 0)
var hitstun = 0

func _physics_process(_delta):
	movement_loop()
	controls_loop()
	
func movement_loop():
	var motion
	if hitstun != 0:
		return
	else:
		motion = movedir.normalized() * speed
		move_and_slide(motion, Vector2(0, 0))
		
func controls_loop():
	var LEFT = Input.is_action_pressed('move_left')
	var RIGHT = Input.is_action_pressed('move_right')
	var UP = Input.is_action_pressed('move_up')
	var DOWN = Input.is_action_pressed('move_down')
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	
	
	
