extends CharacterBody2D


@export var SPEED = 150.0
@export var JUMP_VELOCITY = -200.0
@export var ACC = 30000


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor() or Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if direction == 1:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("jump", 1, false)
		else:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("jump", 1, false)
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("idle", 1, false)

	move_and_slide()


func _on_saw_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
