extends KinematicBody2D

const GRAVITY_VEC = Vector2(0,900)
const FLOOR_NORMAL = Vector2(0,-1)
const SLOPE_SLIDE_STOP = 25.0
const MIN_ONAIR_TIME = 0.01
const JUMP_SPEED = 390

#const GRAVITY = 4000
const WALK_MAX_SPEED = 100
const ACCEL = 500
const FRICTION = -800


#var vel = Vector2()
var linear_vel = Vector2()
var onair_time = 0
var on_floor = false
var acc = Vector2()
var anim_name = "idle"

onready var sprite = get_node("Sprite")
onready var anim = get_node("Animation")

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	
	onair_time += delta
	
	# Apply Gravity
	linear_vel += delta * GRAVITY_VEC
	# Move and slide
	linear_vel = move_and_slide(linear_vel, FLOOR_NORMAL, SLOPE_SLIDE_STOP)
	# Detect Floor
	if (is_move_and_slide_on_floor()):
		onair_time = 0
		
	on_floor = onair_time < MIN_ONAIR_TIME
	
	# Horizontal movement
	var target_speed = 0
	if(Input.is_action_pressed("ui_left")):
		target_speed += -1
	if(Input.is_action_pressed("ui_right")):
		target_speed += 1
	
	target_speed *= WALK_MAX_SPEED
	linear_vel.x = lerp(linear_vel.x, target_speed, 0.3)
	
	# Jumping
	if(on_floor and Input.is_action_pressed("ui_up")):
		linear_vel.y = -JUMP_SPEED
		get_node("Sound").play("Jump")
	
	# Animation
	var new_anim = "idle"
	
	if(on_floor):
		if (abs(linear_vel.x) > 0):
			new_anim = "walk"
	else:
		new_anim = "jump"
		
	if linear_vel.x > 0:
		sprite.set_flip_h(false)
	elif linear_vel.x < 0:
		sprite.set_flip_h(true)
	
	if (new_anim != anim_name):
		anim_name = new_anim
		anim.play(anim_name)
	
	# I need to check this code later
	#acc.y = GRAVITY
	
	# Input
	# acc.x = Input.is_action_pressed("ui_right") - Input.is_action_pressed("ui_left")
	# acc.x *= ACCEL
	# if acc.x == 0:
	#	acc.x = vel.x * FRICTION * delta
	
	#vel += acc * delta
	#vel.x = clamp(vel.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)
	
	# Motion based on collision
	#var motion = move(vel * delta)
	#if is_colliding():
	#	var n = get_collision_normal()
	#	motion = n.slide(motion)
	#	vel = n.slide(vel)
	#	move(motion)
