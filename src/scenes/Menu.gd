extends Control

var background = preload("res://src/scenes/MenuMap.tscn")
var curr_back

func _ready():
	loadBackground()
	Game.connect("game_over", self, "_on_game_over");

func _on_ExitButton_pressed():
	get_tree().quit();
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		_on_ExitButton_pressed()

func loadBackground():
	curr_back = background.instance()
	add_child(curr_back)

func _on_StartButton_pressed():
	$CanvasLayer/Control.visible = false
	set_process(false)
	Game.set_process(true)
	Game.loadLevel(load("res://src/scenes/levels/Tutorial.tscn"))
	#$Tilemap.visible = false
	$AudioStreamPlayer.stop()
	remove_child(curr_back)
	curr_back.queue_free()

func _on_game_over():
	$CanvasLayer/Control.visible = true
	loadBackground()
	$AudioStreamPlayer.play()
	set_process(true)
	Game.set_process(false)
