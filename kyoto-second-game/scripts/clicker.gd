extends Button

# clicker modifiers -- inputs for one button

var upgrade_cost: int = 50
var upgrade_scale: float = 1
var clickbutton_strength: int = 5
@export var game_manager: Node
@export var coin_label: Label
@export var upgrade: bool = true
@onready var upgrade_label: Button = $UpgradeButton
@onready var Sound: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

## - - | CLICKER FUNCTIONS | - - 
func _on_button_down() -> void:
	game_manager.click_button(clickbutton_strength)
	
## - - | UPGRADE FUNCTIONS | - -

func _on_upgrade_button_button_down() -> void:
	if game_manager.coin >= upgrade_cost:
		clickbutton_strength *= 1.5
		game_manager.coin -= upgrade_cost
		game_manager.refresh_coin_count()
		
		upgrade_cost += 50 * upgrade_scale
		upgrade_scale += 2.5
		upgrade_label.text = "Upgrade (" + str(upgrade_cost) + " Coins)"
		Sound.play()
