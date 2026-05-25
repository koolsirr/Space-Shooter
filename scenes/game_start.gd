extends Control

var level_scene: PackedScene = load("res://scenes/level.tscn")

func _ready() -> void:
	$Game.play()


func _input(_event):
	if Input.is_action_pressed("shoot"):
		get_tree().change_scene_to_packed(level_scene)
