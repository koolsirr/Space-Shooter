extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float


signal collision
signal meteor_killed

var can_collide := true



func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	
	var path: String = "res://PNG/Meteors/"+ str(rng.randi_range(1,8)) +".png"
	$Sprite2D.texture = load(path)
	
	
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0,width)
	var random_y = rng.randi_range(-100,-50)
	position = Vector2(random_x,random_y)
	
	speed = rng.randi_range(200,500)
	direction_x = rng.randf_range(-1,1)
	rotation_speed = rng.randi_range(40,100)


func _process(delta: float) -> void:
	position += Vector2(direction_x, 1.0) * 200 * delta
	rotation_degrees += rotation_speed * delta
	
	
func _on_body_entered(_body):
	if can_collide:
		collision.emit()

func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	meteor_killed.emit()  #esle chai meteor mareko 
	$Explode.play()
	$Sprite2D.hide()
	can_collide = false
	await get_tree().create_timer(1).timeout
	queue_free()
