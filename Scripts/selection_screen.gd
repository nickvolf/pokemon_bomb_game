extends Control

enum STATE {SELECT, GUESS, ANSWER}

var current_state = STATE.SELECT

# Button Screen
onready var ButtonContainer = $ButtonContainer

# Set Up Screen
onready var SetUpScreen = $SetUpScreen

# Question Screen
onready var ThreeBallsScreen = $ThreeBallsScreen
onready var QuestionScreen = $QuestionScreen
onready var QuestionLabel:Label = $QuestionScreen/Question/QuestionContainer/Label
onready var AnswerLabel:Label = $QuestionScreen/Answer/QuestionContainer/Label
onready var QuestionImage:TextureRect = $QuestionScreen/Image/QuestionContainer/TextureRect
onready var WrongButton = $QuestionScreen/WrongButton
onready var CorrectButton = $QuestionScreen/CorrectButton
onready var PointsRevealScreen = $PointsReveal
onready var timer: Timer = $QuestionScreen/TimerBar/Timer

#Sounds
onready var BattleMusic := $Sounds/BattleMusic
onready var SelectMusic := $Sounds/SelectMusic
onready var VictoryMusic := $Sounds/VictoryMusic
onready var Cry := $Sounds/PokemonCry

# Books
onready var Tests = $TestResources
onready var PokemonManager = $PokemonManager

export(Resource) var mew
export(Resource) var current_test
var question_dict := {}
var pokemon_array: Array = []
var was_mew_shown := false

var team_one_points := 0
var team_two_points := 0
var team_three_points := 0


func _ready():
	randomize()
	SetUpScreen.connect("game_started", self, "make_game")
	ButtonContainer.connect("button_clicked", self, "on_button_clicked")
	assign_questions(current_test)
	QuestionScreen.visible = false
	pokemon_array = PokemonManager.pokemons


func _input(event):
	match current_state:
		STATE.SELECT:
			pass
		STATE.GUESS:
			if event is InputEventMouseButton and event.pressed:
				AnswerLabel.visible = true
				WrongButton.visible = true
				CorrectButton.visible = true
				current_state = STATE.ANSWER
		STATE.ANSWER:
			pass


func assign_questions(test: book_quiz):
	var questions:Array = test.set_array()
	questions.shuffle()
	for i in ButtonContainer.buttons.size():
		var button = ButtonContainer.buttons[i]
		var question = questions[i]
		question_dict[button.name] = question


func on_button_clicked(name):
	QuestionScreen.visible = true
	QuestionLabel.text = question_dict[name].question
	AnswerLabel.text = question_dict[name].answer
	AnswerLabel.visible = false
	CorrectButton.visible = false
	WrongButton.visible = false
	QuestionImage.texture = question_dict[name].image_hint
	timer.start()
	
	current_state = STATE.GUESS


func _on_WrongButton_pressed():
	QuestionScreen.visible = false
	current_state = STATE.SELECT


func _on_CorrectButton_pressed():
	QuestionScreen.visible = false
	current_state = STATE.SELECT
	var rand10 = randi() % 10
	if rand10 < 6:
		show_points_reveal_screen()
	if rand10 >= 6:
		show_three_balls_screen()


func show_three_balls_screen():
	ThreeBallsScreen.visible = true
	SelectMusic.stop()
	BattleMusic.play()


func show_points_reveal_screen():	
	pokemon_array.shuffle()	
	var pokemon: Pokemon = pokemon_array.pop_front()
	PointsRevealScreen.pokeball_sprite.visible = true
	PointsRevealScreen.pokemon_sprite.texture = pokemon.texture
	PointsRevealScreen.pokemon_name.text = pokemon.name
	PointsRevealScreen.points.text = str(pokemon.points)
	PointsRevealScreen.animationPlayer.play("shake")
	PointsRevealScreen.visible = true
	SelectMusic.stop()
	BattleMusic.play()


func make_game(book:String, chapter:int):
	print("Making game using " + book + ": Chapter " + str(chapter))
	for test in Tests.all_tests:
		if test.book == book and test.chapter == chapter:
			assign_questions(test)
			break
	SetUpScreen.visible = false


func _on_PointsRevealButton_pressed():
	PointsRevealScreen.pokeball_sprite.visible = false
	PointsRevealScreen.pokemon_name.visible = true
	PointsRevealScreen.points.visible = true
	PointsRevealScreen.reveal_button.visible = false
	PointsRevealScreen.return_button.visible = true	
	PointsRevealScreen.animationPlayer.stop()
	BattleMusic.stop()
	Cry.play()
	VictoryMusic.play()


func _on_ReturnButton_pressed():
	PointsRevealScreen.visible = false
	PointsRevealScreen.reveal_button.visible = true
	PointsRevealScreen.return_button.visible = false
	PointsRevealScreen.pokemon_name.visible = false
	PointsRevealScreen.points.visible = false
	PointsRevealScreen.pokeball_sprite.visible = true
	BattleMusic.stop()
	VictoryMusic.stop()
	SelectMusic.play()


func _on_choose_option_pressed():
	if was_mew_shown == false:
		var rand = randi() % 4
		match rand:
			0:
				ThreeBallsScreen.MewtwoLabel.visible = true
				ThreeBallsScreen.display_buttons(false)
			1:		
				ThreeBallsScreen.TrainerLabel.visible = true			
				ThreeBallsScreen.display_buttons(false)
			2:
				PointsRevealScreen.visible = true
				ThreeBallsScreen.visible = false
				PointsRevealScreen.animationPlayer.play("shake")			
				PointsRevealScreen.pokemon_sprite.texture = mew.texture
				PointsRevealScreen.pokemon_name.text = mew.name
				PointsRevealScreen.points.text = str(mew.points)
				was_mew_shown = true
			3:		
				ThreeBallsScreen.TeamPlasmaLabel.visible = true			
				ThreeBallsScreen.display_buttons(false)
	else:
		var rand = randi() % 3
		match rand:
			0:
				ThreeBallsScreen.MewtwoLabel.visible = true
				ThreeBallsScreen.display_buttons(false)
			1:		
				ThreeBallsScreen.TrainerLabel.visible = true			
				ThreeBallsScreen.display_buttons(false)
			2:		
				ThreeBallsScreen.TeamPlasmaLabel.visible = true			
				ThreeBallsScreen.display_buttons(false)


func _on_ThreeBallsReturnButton_pressed():
	ThreeBallsScreen.visible = false
	ThreeBallsScreen.display_buttons(true)
	ThreeBallsScreen.MewtwoLabel.visible = false
	ThreeBallsScreen.TrainerLabel.visible = false
	ThreeBallsScreen.TeamPlasmaLabel.visible = false
	BattleMusic.stop()
	VictoryMusic.stop()
	SelectMusic.play()


func _on_Timer_timeout():
	pass # Replace with function body.


func _on_Team1Points_pressed():
	team_one_points += 1
	$Points/HBoxContainer/Team1/Score.text = str(team_one_points)

func _on_Team1PointsMinus_pressed():
	team_one_points -= 1
	$Points/HBoxContainer/Team1/Score.text = str(team_one_points)

func _on_Team2Points_pressed():
	team_two_points += 1
	$Points/HBoxContainer/Team2/Score.text = str(team_two_points)
	
func _on_Team2Points2Minus_pressed():
	team_two_points -= 1
	$Points/HBoxContainer/Team2/Score.text = str(team_two_points)


func _on_Team3Points_pressed():
	team_three_points += 1
	$Points/HBoxContainer/Team3/Score.text = str(team_three_points)


func _on_Team3PointsMinus_pressed():
	team_three_points -= 1
	$Points/HBoxContainer/Team3/Score.text = str(team_three_points)
