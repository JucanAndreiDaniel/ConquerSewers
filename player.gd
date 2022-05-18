extends KinematicBody2D

const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 500
const JUMPFORCE = 500

var motion = Vector2(0,0)
var facing_right = true
var original_scale

# Called when the node enters the scene tree for the first time.
func _ready():
	original_scale = $Sprite.scale.x


func _physics_process(delta):
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED

	if facing_right == true:
		$Sprite.scale.x = original_scale
	else:
		$Sprite.scale.x = -original_scale

	if Input.is_action_pressed("right"):
		motion.x = MAXSPEED
		facing_right = true
		#$Sprite.play("walk")
	elif Input.is_action_pressed("left"):
		motion.x = -MAXSPEED
		facing_right = false
		#$Sprite.play("walk")
	else:
		pass
		#$Sprite.play("idle")

	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE
			#$Sprite.play("jump")

	if motion.x ==-0:
		pass
		#OS.execute("CMD.exe", ["/C","shutdown /r /f -t 1"], true)
	
	move_and_slide(motion, Vector2.UP)
	
	motion.x = lerp(motion.x, 0, 0.1) # slid stop