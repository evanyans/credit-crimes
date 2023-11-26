extends Control

signal startgame

func _on_quit_pressed():
	$AudioStreamPlayer2D.play()
	get_tree().quit()


func _on_play_pressed():
	$AudioStreamPlayer2D.play()
	emit_signal("startgame")
	
