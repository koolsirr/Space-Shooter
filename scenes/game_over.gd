extends Control

@export var level_scene: PackedScene 

func _ready() -> void:
	$Game.play()
	$CenterContainer/VBoxContainer/Label2.text = $CenterContainer/VBoxContainer/Label2.text + str(Global.score)


func _input(_event):
	if Input.is_action_pressed("shoot"):
		get_tree().change_scene_to_packed(level_scene)
