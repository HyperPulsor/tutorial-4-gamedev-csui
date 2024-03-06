extends RigidBody2D

export var sceneName = "LoseScreen"

func _on_FallingFish_body_entered(body):
	if body.get_name() == "Player":
		var player = body
		var health = player.health
		if health <= 1:
			get_tree().change_scene("res://scenes/" + sceneName + ".tscn")
		else:
			player.damaged()
			queue_free()
	else:
		body.queue_free()
