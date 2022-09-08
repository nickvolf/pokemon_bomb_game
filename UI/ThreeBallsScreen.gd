extends Control

var buttons: Array =[]

onready var MewtwoLabel = $Mewtwo
onready var TrainerLabel = $TrainerBattle
onready var TeamPlasmaLabel = $TeamPlasma

# Called when the node enters the scene tree for the first time.
func _ready():
	buttons = [
		$Choice1,
		$Choice2,
		$Choice3
	]
	
func display_buttons(setting: bool):
	for button in buttons:
		button.visible = setting
