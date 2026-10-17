extends Node2D
@onready var spawn_timer: Timer = $SpawnTimer

var obstacle_scene: PackedScene = preload("res://Scene/obstacle.tscn")

func _on_spawn_timer_timeout() -> void:
	var obstacle = obstacle_scene.instantiate()
	add_child(obstacle)
	obstacle.position.y = randf_range(-220.0, 120.0)
	
func start() -> void:
	spawn_timer.start()

func stop() -> void:
	spawn_timer.stop()
	
