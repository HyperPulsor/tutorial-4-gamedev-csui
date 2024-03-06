extends KinematicBody2D

const UP = Vector2(0, -1)

export var speed: int = 400
export var GRAVITY: int = 1200
export var jump_speed: int = -400

var velocity: Vector2 = Vector2()
var health: int = 2

onready var heart: Sprite = get_node("Camera2D").get_node("Heart")
onready var save_file = SaveFile.g_data
var half_heart = preload("res://assets/kenney_platformerpack/PNG/HUD/hudHeart_half.png")

func _ready():
	if get_tree().get_current_scene().get_name() == "Level2":
		health = save_file.health
		if health < 2:
			heart.texture = half_heart

func damaged():
	health = health - 1
	heart.texture = half_heart
	return health


func get_input():
	velocity.x = 0
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed
	if Input.is_action_pressed("right"):
		velocity.x += speed
	if Input.is_action_pressed("left"):
		velocity.x -= speed


func _physics_process(delta):
	velocity.y += delta * GRAVITY
	print(health)
	get_input()
	velocity = move_and_slide(velocity, UP)


func _process(_delta):
	if velocity.y != 0:
		$Animator.play("Jump")
	elif velocity.x != 0:
		$Animator.play("Walk")
		if velocity.x > 0:
			$Sprite.flip_h = false
		else:
			$Sprite.flip_h = true
	else:
		$Animator.play("Idle")
