extends RigidBody2D

export var sceneName = "LoseScreen"
var fall_speed = 1000 

func _on_FallingFish_body_entered(body):
	if body.get_name() == "Player":
		var player = body
		var health = player.health
		if health <= 1:
			get_tree().change_scene("res://scenes/" + sceneName + ".tscn")
		else:
			player.damaged()
			queue_free()

func _physics_process(delta):
	linear_velocity.y += fall_speed * delta
