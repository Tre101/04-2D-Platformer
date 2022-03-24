extends KinematicBody2D

export var constraint_left = Vector2(0,0)
export var constraint_right = Vector2(100,0)
export var speed = 3

export var damage = 10

func _ready():
	pass

func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x,
		"pos_y" : position.y,
	}
	return save_dict

func _physics_process(_delta):
	if not $Tween.is_active():
		var constraint = constraint_left
		$Sprite.flip_h = true
		if position != constraint_right:
			constraint = constraint_right
			$Sprite.flip_h = false
		$Tween.interpolate_property(self, "position", position, constraint, speed, Tween.TRANS_EXPO, Tween.EASE_IN)
		$Tween.start()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		#body.do_damage(damage)
		body.queue_free()
