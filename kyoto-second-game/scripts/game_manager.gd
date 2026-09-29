extends Control

@onready var coin_scene:PackedScene = load("res://object scenes/animated_coin.tscn")
# setting initial coin to 0
@export var coin: int

# setting label
@onready var coin_label: Label = $CoinLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# setting initial coin to 0
	coin = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

## - - | CLICKER SIGNAL FUNCTIONS | - - 

# Receiver function for clickerbutton
func click_button(strength: int) -> void:
	# whenever clicker is clicked, add x amount coins
	coin += strength
	
	var c = coin_scene.instantiate()
	add_child(c)
	c.global_position = get_global_mouse_position()
	refresh_coin_count()
	print (coin)
	# profit
	
# Receiver function for autoclicker
func auto_clicker(strength: int, Sprite: Sprite2D) -> void:
	var chohan_rate: int = randi_range(1, 2)
	var win: bool = chohan_rate % 2 == 1
	if win:
		var c = coin_scene.instantiate()
		add_child(c)
		c.global_position = Sprite.global_position
		coin += strength
		print(str(strength) + " won from chohan")
		refresh_coin_count()

func refresh_coin_count() -> void:
	coin_label.text = "Coin: " + str(coin)
