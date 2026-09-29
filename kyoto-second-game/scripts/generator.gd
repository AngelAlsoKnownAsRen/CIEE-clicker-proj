extends Control

var autoclicker_strength: int = 5
@export var game_manager: Node
@export var coin_label: Label
@onready var autoclicktimer: Timer = $Autoclicker
@onready var autoupgrade_label: Button = $AutoclickUpgradeButton

@onready var Sound: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var Sprite: Sprite2D = $Sprite2D
@export var purchase_cost: int = 250
@export var autoupgrade_cost: int = 50
var autoclick_on: bool = false
var autoupgradestrength_scale: int = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	autoupgrade_label.text = "Purchase Auto Chohan (" + str(purchase_cost) + " Coins)"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _on_autoclick_upgrade_button_button_down() -> void:
	if autoclick_on == false and game_manager.coin >= purchase_cost:
		game_manager.coin -= purchase_cost
		autoclick_on = true
		autoupgrade_label.text = "Upgrade (" + str(autoupgrade_cost) + " Coins)"
		autoclicktimer.start()
		Sound.play()
		game_manager.refresh_coin_count()
		print("autoclicker purchased true")
		
	elif game_manager.coin >= autoupgrade_cost:
		autoclicker_strength *= 2
		game_manager.coin -= autoupgrade_cost
		game_manager.refresh_coin_count()
		print("auto upgrade pressed")
		Sound.play()
		autoupgrade_cost += 50 * autoupgradestrength_scale
		autoupgradestrength_scale += 2
		autoupgrade_label.text = "Upgrade (" + str(autoupgrade_cost) + " Coins)"

func _on_autoclicker_timeout() -> void:
	if autoclick_on == true:
		game_manager.auto_clicker(autoclicker_strength, Sprite)
