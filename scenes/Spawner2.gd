extends Node2D

export (PackedScene) var obstacle
export var timer_duration: int = 1

func _ready():
	repeat()

func spawn():
	var spawned = obstacle.instance()
	get_parent().call_deferred("add_child", spawned)
	
	var spawn_pos = global_position

	spawned.global_position = spawn_pos

func repeat():
	spawn()
	yield(get_tree().create_timer(timer_duration), "timeout")
	repeat()
