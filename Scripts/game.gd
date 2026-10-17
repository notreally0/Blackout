extends Node2D
@onready var obstacle_spawner: Node2D = $ObstacleSpawner
@onready var ground: StaticBody2D = $Ground
@onready var hud: CanvasLayer = $HUD
var score := 0

func _ready() -> void:
	hud.set_score(score)
	
func _on_player_game_started() -> void:
	obstacle_spawner.start()
	hud.hide_start_message()


func _on_player_died() -> void:
	obstacle_spawner.stop()
	$Ground/AnimationPlayer.pause()
	get_tree().call_group("obstacles", "stop")


func _on_player_scored() -> void:
	score += 1
	hud.set_score(score)
