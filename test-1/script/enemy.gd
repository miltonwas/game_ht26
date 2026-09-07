extends CharacterBody2D


const SPEED = 300

# en referens till spelar scenen, sätts av föräldern
var player: Player

func _physics_process(delta: float) -> void:
	if player:
		var dir: Vector2 = global_position.direction_to(player.global_position)
		velocity = dir * SPEED
		move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
