extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
@onready var colision = $CollisionShape2D
var speed = 150
@export var gravity = 55
@export var jump_force = 600
var jump_max = 2
var compteur_jump = 0
var doublejump = false


func animation_personnage():
	if Input.is_action_pressed("ui_right"):
		colision.position.x = 0
		animation.flip_h = false
		animation.play("run")
	elif Input.is_action_pressed("ui_left"):
		colision.position.x = 17
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
	

	#reset jump
	if is_on_floor() and compteur_jump != 0:
		compteur_jump = 0
	
	if compteur_jump < jump_max:
		if Input.is_action_just_pressed("ui_select"):
			jump()
		
			
	#dash
	if Input.is_action_just_pressed("dash"):
		dash()
		
	move_and_slide()
	animation_personnage()
	
func jump():
	velocity.y = -jump_force
	compteur_jump += 1
	print(compteur_jump)
		
func dash():
	speed = speed * 3
	print(speed)
	if speed == 450:
		$Timer.start()
	

func _on_timer_timeout():
	speed = 150
