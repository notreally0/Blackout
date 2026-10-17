extends CharacterBody2D

func _physics_process(delta: float) -> void:
	velocity.x = -215.0
	move_and_slide()
	
	if global_position.x < -200.0:
		queue_free()
func _on_pillertop_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.die

func _on_piller_bottem_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.die()

func _on_score_box_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("player scored")
