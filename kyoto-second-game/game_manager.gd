extends Control

# setting initial coin to 0
var coin: int = 0
var clickbutton_strength: int = 10
var upgrade1_cost: int = 50
@onready var coin_label: Label = $CoinLabel
@onready var upgrade_label: Button = $ClickerButton/UpgradeButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# setting initial coin to 0
	coin = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Reciever function for clickerbutton
func _on_clicker_button_button_down() -> void:
	# whenever clicker is clicked, add 10 coins
	coin += clickbutton_strength
	
	coin_label.text = "Coin: " + str(coin)
	print (coin)
	# profit


func _on_upgrade_button_button_down() -> void:
	if coin >= upgrade1_cost:
		clickbutton_strength *= 2
		coin -= upgrade1_cost
		coin_label.text = "Coin: " + str(coin)
		
		upgrade1_cost += 50
		upgrade_label.text = "Upgrade (" + str(upgrade1_cost) + " Coins)"
