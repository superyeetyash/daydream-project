extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

const SPEED = 2000.0
const JUMP_VELOCITY = -1750.0

func _ready() -> void:
	anim.play("idle")

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Left / Right movement
	var direction := Input.get_axis("left", "right")
	if direction != 0:
		velocity.x = direction * SPEED
		anim.flip_h = direction < 0

		if is_on_floor():
			anim.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			anim.play("idle")

	# Jump/Fall animation
	if not is_on_floor():
		if velocity.y < 0:
			anim.play("jump")
		else:
			anim.play("fall")

	move_and_slide()
