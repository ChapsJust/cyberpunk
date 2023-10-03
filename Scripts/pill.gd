extends Area2D

var is_picked_up = false



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if not is_picked_up and body.is_in_group("player"):
		var player = body
		if "increment_jump_max" in player:
			player.increment_jump_max()
		is_picked_up = true
		queue_free()
