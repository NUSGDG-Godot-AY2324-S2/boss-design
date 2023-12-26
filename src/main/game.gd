extends Node2D


func update_player_healthbar(value):
	$UI/Control/MarginContainer/PlayerHealthbarContainer/PlayerHealthbar.value = value


func update_boss_healthbar(value):
	$UI/Control/MarginContainer/BossHealthbarContainer/BossHealthbar.value = value
