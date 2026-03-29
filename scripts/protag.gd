extends CharacterBody2D

var direction: Vector2
var speed: int = 200
var target = position

# tracks which movement is active
enum MoveMode { WASD, CLICK }
var move_mode := MoveMode.WASD # default

# scaling variables
var depth_y: float = 0.0
const SCALE_FACTOR = .002
var initial_scale: Vector2

# keeps original scalling
func _ready() -> void:
	initial_scale = scale

func _input(event: InputEvent) -> void:
	# get the position of the mouse click
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()
		move_mode = MoveMode.CLICK
		
func _physics_process(delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	
	# default to WASD movement
	if direction != Vector2.ZERO:
		move_mode = MoveMode.WASD

	# clicking movement
	if move_mode == MoveMode.CLICK:
		# prevent character from bugging when it gets close to target dest
		if position.distance_to(target) > 10: 
			velocity = position.direction_to(target) * speed
			move_and_slide()
		else:
			velocity = Vector2.ZERO
	else:
		# otherwise, switch back to WASD
		velocity = direction * speed
		move_and_slide()
		
	animation(delta)


func animation(delta: float) -> void:
	var is_moving := (velocity != Vector2.ZERO)
	
	if is_moving:
		# flip
		if velocity.x != 0:
			$AnimatedSprite2D.flip_h = velocity.x > 0
		$AnimatedSprite2D.animation = 'walk'
		
		# depth scaling calculation
		depth_y += velocity.y * delta
		var scale_multiplier = 1.0 + depth_y * SCALE_FACTOR
		scale_multiplier = clamp(scale_multiplier, 0.5, 2.0)
		scale = initial_scale * scale_multiplier
	else:
		$AnimatedSprite2D.frame = 0
