extends Control


onready var pokemon_sprite: Sprite = $PokemonSprite
onready var pokeball_sprite: Sprite = $Pokeball
onready var pokemon_name: Label = $PokemonName
onready var points: Label = $Points
onready var reveal_button = $PointsRevealButton
onready var return_button = $ReturnButton
onready var animationPlayer = $Pokeball/AnimationPlayer



func _ready():
	pass
