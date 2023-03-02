extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$UILayer/VersionLabel.text = "Welcome to Advanced Programming with Godot " + Engine.get_version_info().string


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and ($Player.position - $Chest.position).length() < 20:
		$Chest.opened()

