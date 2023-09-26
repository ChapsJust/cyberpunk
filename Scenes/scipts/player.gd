extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
var speed = 200
@export var gravity = 55
@export var jump_force = 800

func animation_personnage():
	if Input.is_action_pressed("ui_right"):
		animation.flip_h = false
		animation.play("run")
	elif Input.is_action_pressed("ui_left"):
		animation.flip_h = true
		animation.play("run")
	elif velocity.x == 0:
		animation.play("idle")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity
		if velocity.y > 2000:
			velocity.y = 2000
			
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else: 
		velocity.x = 0
	
	if Input.is_action_pressed("ui_select"):
		if is_on_floor():
			velocity.y = -jump_force
			
	move_and_slide()
	animation_personnage()
	
