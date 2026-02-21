extends BaseEnemy
class_name TeleporterEnemy

@onready var TeleportTimer = Timer.new()
@onready var SoundEffect = load("res://Audio/sfx/printer.wav") 

func _afterready():
	add_child(TeleportTimer)
	TeleportTimer.wait_time = origjson.get("teleportTime",5)
	TeleportTimer.start()
	TeleportTimer.connect("timeout",Teleport)

func Teleport():
	print(enemydata)
	var SoundPlayer = AudioStreamPlayer.new()
	SoundPlayer.stream = SoundEffect
	add_child(SoundPlayer)
	SoundPlayer.play()
	global_position.x += randi_range(-100,100)
	TeleportTimer.start(0)
	
