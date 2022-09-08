extends Control

signal game_started

var book_dict = {
	0 : "Story Central 1",
	1 : "Story Central 2",
	2 : "Story Central 3",
	3 : "Story Central 4",
	4 : "Story Central 5",
	5 : "Story Central 6",
	}
	
var chosen_book = book_dict[0]
var chosen_chapter: int = 1

onready var BookList = $BookList
onready var ChapterList = $ChapterList
onready var StartButton = $StartButton

# Called when the node enters the scene tree for the first time.
func _ready():
	BookList.connect("item_selected", self, "on_book_chosen")
	ChapterList.connect("item_selected", self, "on_chapter_chosen")
	StartButton.connect("pressed", self, "send_and_create_game")
	
	for key in book_dict:
		BookList.add_item(book_dict[key], key)
	for i in range(9):
		ChapterList.add_item(str(i+1), i)
	
func on_book_chosen(id):
	chosen_book = book_dict[id]

func on_chapter_chosen(id):
	chosen_chapter = id+1

func send_and_create_game():
	emit_signal("game_started", chosen_book, chosen_chapter)
