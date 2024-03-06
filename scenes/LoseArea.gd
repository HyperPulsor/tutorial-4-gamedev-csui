extends Area2D

export var sceneName: String = "Level 1"

onready var save_file = SaveFile.g_data

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		var player = body
		save_file.health = player.health
		SaveFile.save_data()
		get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))
	else :
		body.queue_free()
