extends KinematicBody2D

export(int) var speed = 50
var state = 'default'
var movedir = Vector2(0, 0)
var knockdir = Vector2(0, 0)
var spritedir = 'left'
var hitstun = 0
var entity_name = ''
onready var anim = $anim
	
func state_machine(newstate):
	if state != newstate:
		state = newstate
		
func movement_loop():
	var motion
	if hitstun != 0:
		return
	else:
		motion = movedir.normalized() * speed
		move_and_slide(motion, Vector2(0, 0))

func spritedir_loop():
	if movedir.x == 1:
		spritedir = 'right'
	if movedir.x == -1:
		spritedir = 'left'
	
func anim_switch(animation):
	var newanim = str(animation, spritedir)
	if anim.current_animation != newanim:
		anim.play(newanim)
	
