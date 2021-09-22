extends "res://Entity.gd"

func _physics_process(_delta):
	movement_loop()
	spritedir_loop()
	controls_loop()
	
	if movedir != Vector2(0, 0):
		anim_switch('walk')
	else:
		anim_switch('idle')
	
func controls_loop():
	var LEFT = Input.is_action_pressed('move_left')
	var RIGHT = Input.is_action_pressed('move_right')
	var UP = Input.is_action_pressed('move_up')
	var DOWN = Input.is_action_pressed('move_down')
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
