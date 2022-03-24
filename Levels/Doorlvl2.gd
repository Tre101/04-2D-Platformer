extends Area2D


func _ready():
	pass


func _on_Doorlvl2_body_entered(body):
	if body.name == "Player":
		if Global.save_data["level"] == 1:
			Global.save_data['level'] = 2
		var _scene = get_tree().change_scene("res://UI/End_Game_S.tscn")
