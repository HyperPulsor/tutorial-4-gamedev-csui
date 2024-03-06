extends Node

const SAVE_FILE = "user://save_file.save"
var g_data: Dictionary = {}

func save_data():
	var file = File.new()
	file.open(SAVE_FILE, file.WRITE)
	file.store_var(g_data)
	file.close()

func load_data():
	var file = File.new()
	if not file.file_exists(SAVE_FILE):
		g_data = {
			"health": 0
		}
		save_data()
	file.open(SAVE_FILE, file.File.READ)
	g_data = file.get_var()
	file.close()
