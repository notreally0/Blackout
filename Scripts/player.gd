extends RigidBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal game_started
var started := false
var is_alive := true
signal died

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
	
func die() -> void:
	if is_alive:
		is_alive = false 
		died.emit()
