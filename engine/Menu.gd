extends Control

var game = load("res://game.tscn")

func _on_quit_pressed():
	$AudioStreamPlayer2D.play()
	get_tree().quit()


func _on_play_pressed():
	$AudioStreamPlayer2D.play()
	get_tree().change_scene_to_packed(game)
	
