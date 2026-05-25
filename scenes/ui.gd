extends CanvasLayer

static var image = load("res://PNG/UI/playerLife1_red.png")
var time_elapsed := 0

func set_health(amount):
	
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
		
	
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP

	
#yo garyo bhane chai kati second bachyo count garcha

#func _on_score_timer_timeout() -> void:
	#time_elapsed += 1
	#$MarginContainer/Label.text = str(time_elapsed)
	#Global.score = time_elapsed

# yo garera chai kati ota meteor maryo count garcha
func add_meteor_score():
	Global.score +=1
	$MarginContainer/Label.text = str(Global.score)
