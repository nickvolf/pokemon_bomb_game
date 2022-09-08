extends CenterContainer

signal button_clicked

onready var ButtonA: TextureButton = $GridContainer/A/TextureButtonA
onready var ButtonB: TextureButton = $GridContainer/B/TextureButtonB
onready var ButtonC: TextureButton = $GridContainer/C/TextureButtonC
onready var ButtonD: TextureButton = $GridContainer/D/TextureButtonD
onready var ButtonE: TextureButton = $GridContainer/E/TextureButtonE
onready var ButtonF: TextureButton = $GridContainer/F/TextureButtonF
onready var ButtonG: TextureButton = $GridContainer/G/TextureButtonG
onready var ButtonH: TextureButton = $GridContainer/H/TextureButtonH
onready var ButtonI: TextureButton = $GridContainer/I/TextureButtonI
onready var ButtonJ: TextureButton = $GridContainer/J/TextureButtonJ
onready var ButtonK: TextureButton = $GridContainer/K/TextureButtonK
onready var ButtonL: TextureButton = $GridContainer/L/TextureButtonL
onready var ButtonM: TextureButton = $GridContainer/M/TextureButtonM
onready var ButtonN: TextureButton = $GridContainer/N/TextureButtonN
onready var ButtonO: TextureButton = $GridContainer/O/TextureButtonO
onready var ButtonP: TextureButton = $GridContainer/P/TextureButtonP
onready var ButtonQ: TextureButton = $GridContainer/Q/TextureButtonQ
onready var ButtonR: TextureButton = $GridContainer/R/TextureButtonR
onready var ButtonS: TextureButton = $GridContainer/S/TextureButtonS
onready var ButtonT: TextureButton = $GridContainer/T/TextureButtonT
onready var ButtonU: TextureButton = $GridContainer/U/TextureButtonU
onready var ButtonV: TextureButton = $GridContainer/V/TextureButtonV
onready var ButtonW: TextureButton = $GridContainer/W/TextureButtonW
onready var ButtonX: TextureButton = $GridContainer/X/TextureButtonX
onready var ButtonY: TextureButton = $GridContainer/Y/TextureButtonY
onready var ButtonZ: TextureButton = $GridContainer/Z/TextureButtonZ

var buttons: Array = []

func _ready():	
	connect_buttons()

func connect_buttons():
	buttons = [
		ButtonA,
		ButtonB,
		ButtonC,
		ButtonD,
		ButtonE,
		ButtonF,
		ButtonG,
		ButtonH,
		ButtonI,
		ButtonJ,
		ButtonK,
		ButtonL,
		ButtonM,
		ButtonN,
		ButtonO,
		ButtonP,
		ButtonQ,
		ButtonR,
		ButtonS,
		ButtonT,
		ButtonU,
		ButtonV,
		ButtonW,
		ButtonX,
		ButtonY,
		ButtonZ,	
	]
	
	for button in buttons:
		button.connect("pressed", self, "_on_button_pressed", [button])
	

func _on_button_pressed(button):
	button.disabled = true
	button.get_parent().modulate = Color( 1, 1, 1, .5 )
	emit_signal("button_clicked", button.name)
