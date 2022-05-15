extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALLSPEED	= 200
const MAXSPEED = 200
const JUMPFORCE = 150

var motion = Vector2()
var facing_right = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED

	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1

	if Input.is_action_pressed("right"):
		motion.x = MAXSPEED
		facing_right = true
	elif Input.is_action_pressed("left"):
		motion.x = -MAXSPEED
		facing_right = false
	else:
		motion.x = 0

	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE
	
	motion = move_and_slide(motion, UP)
