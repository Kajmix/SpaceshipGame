extends Control



func _on_play_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/main_game_scene.tscn")


func _on_exit_button_down() -> void:
	get_tree().quit()
