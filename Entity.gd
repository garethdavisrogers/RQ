extends KinematicBody2D

export(int) var speed = 50
var movedir = Vector2(0, 0)
var spritedir = 'left'
var hitstun = 0
onready var anim = $anim
	
func movement_loop():
	var motion
	if hitstun != 0:
		return
	else:
		motion = movedir.normalized() * speed
		move_and_slide(motion, Vector2(0, 0))

func spritedir_loop():
	match movedir.x:
		-1:
			'left'
		1:
			'right'
	
func anim_switch(animation):
	var new_anim = str(animation, spritedir)
	if anim.current_animation != new_anim:
		anim.play(new_anim)
	
