extends CharacterBody2D
class_name Player

#signal för att meddela att spelaren är död
signal dead

const MAX_SPEED = 400
const ACC = 3000

# godot spelloop - anropas automatisk 60 ggr per sekund
func _physics_process(delta: float) -> void:
	
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# velocity är en egenskap som tillhör characterbody2d
	velocity = velocity.move_toward(direction * MAX_SPEED, ACC * delta)
	
	move_and_slide()

func die() -> void:
	#funkton som anropas av enemy
	emit_signal("dead")	
	
