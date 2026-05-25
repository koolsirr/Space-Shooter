extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")

var health: int = 3

func _ready() -> void:
	Global.score = 0
	$Battle.play()
	get_tree().call_group('ui', 'set_health', health)
	
	var size = get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	for star in $stars.get_children():
		var random_x = rng.randi_range(0,size.x)
		var random_y = rng.randi_range(0,size.y)
		star.position = Vector2(random_x,random_y)
		
		var random_scale = rng.randf_range(1,2)
		star.scale = Vector2(random_scale,random_scale)
		
		star.speed_scale = rng.randf_range(0.6,1.4)

func _on_meteor_timer_timeout() -> void:
	var meteor = meteor_scene.instantiate() 
	
	$meteors.add_child(meteor)
	
	meteor.connect('collision',_on_meteor_collision)
	meteor.connect('meteor_killed', _on_meteor_killed)
	
func _on_meteor_killed():
	get_tree().call_group('ui', 'add_meteor_score')
	
	
func _on_meteor_collision():
	health -= 1
	get_tree().call_group('ui', 'set_health', health)
	if health <= 0:
		call_deferred("_go_to_game_over")
	$Player.play_collision_sound()
	
	
func _go_to_game_over():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
