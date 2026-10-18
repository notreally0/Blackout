extends RigidBody2D

signal game_started
var started := false
var is_alive := true
signal died
signal scored
@onready var hit_sound: AudioStreamPlayer = $HitSound
@onready var score_sound: AudioStreamPlayer = $ScoreSound
@onready var flap_sound: AudioStreamPlayer = $FlapSound
@onready var animation_player: AnimationPlayer = $AnimationPlayer
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("flap") && is_alive:
		if !started:
			start_game()
		flap()
		
	if rotation_degrees <= -30.0:
		rotation_degrees = -30.0
		angular_velocity = 0.0
	
	if linear_velocity.y > 0.0:
		if rotation_degrees < 90.0:
			angular_velocity = 5.0
		else:
			angular_velocity = 0.0
			
func start_game() -> void:
	started = true
	gravity_scale = 1.0
	game_started.emit()
	
func flap() -> void:
	linear_velocity.y = -340.0
	angular_velocity = -8.0
	animation_player.play("Idle")
	flap_sound.play()
	
func die() -> void:
	if is_alive:
		is_alive = false 
		died.emit()
		animation_player.pause()
		hit_sound.play()

func score_point() -> void:
	if is_alive:
		scored.emit()
		score_sound.play()
