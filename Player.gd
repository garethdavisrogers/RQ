extends "res://Entity.gd"

func _physics_process(_delta):
	
	match state:
		'default':
			state_default()
		'attack':
			state_attack()
		
func state_default():
	movement_loop()
	spritedir_loop()
	controls_loop()
	
	if movedir != Vector2(0, 0):
		anim_switch('walk')
	else:
		anim_switch('idle')
	
	if Input.is_action_just_pressed("lite_attack"):
		state_machine('attack')
	
func state_attack():
	anim_switch('liteattack1')
	

func controls_loop():
	var LEFT = Input.is_action_pressed('move_left')
	var RIGHT = Input.is_action_pressed('move_right')
	var UP = Input.is_action_pressed('move_up')
	var DOWN = Input.is_action_pressed('move_down')
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)


func _on_anim_animation_finished(anim_name):
	if anim_name == 'liteattack1left' or anim_name == 'liteattack1right':
		state_machine('default')
