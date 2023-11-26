extends Node2D

var animplayer

func _ready():
	animplayer = $AnimationPlayer
	animplayer.play("finish")
