extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

const DASH_SPEED = 800.0
const DASH_TIME = 0.15
const DASH_COOLDOWN = 0.5

var MAX_JUMPS = 2
var jumps_left = MAX_JUMPS

@onready var sprite: AnimatedSprite2D = $Sprite2D

var isLeft = false
var is_dashing = false
var dash_timer = 0.0
var cooldown_timer = 0.0

func jump():
	velocity.y = JUMP_VELOCITY

func flinch(x):
	velocity.y = JUMP_VELOCITY
	velocity.x = x

func _physics_process(delta: float) -> void:
	# --- DASH TIMERS ---
	if dash_timer > 0:
		dash_timer -= delta
	else:
		is_dashing = false

	if cooldown_timer > 0:
		cooldown_timer -= delta

	# --- GRAVITY ---
	if not is_on_floor():
		velocity += get_gravity() * delta

	# --- INPUT ---
	var direction := Input.get_axis("left", "right")

	# --- DASH INPUT ---
	if Input.is_action_just_pressed("dash") and not is_dashing and cooldown_timer <= 0 and direction != 0:
		is_dashing = true
		dash_timer = DASH_TIME
		cooldown_timer = DASH_COOLDOWN
		velocity.x = direction * DASH_SPEED

	# --- MOVEMENT ---
	if not is_dashing:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, 20)

	# --- JUMP ---
	if Input.is_action_just_pressed("jump") and jumps_left > 0 and not is_dashing:
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1
	
	if is_on_floor():
		jumps_left = MAX_JUMPS

	# --- ANIMATION ---
	if is_dashing:
		sprite.animation = "dash"
	elif not is_on_floor():
		isLeft = velocity.x < 0
		sprite.flip_h = isLeft
		sprite.animation = "jumping"
	elif velocity.x != 0:
		isLeft = velocity.x < 0
		sprite.flip_h = isLeft
		sprite.animation = "walking"
	else:
		sprite.animation = "default"

	move_and_slide()
