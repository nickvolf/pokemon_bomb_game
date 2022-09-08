extends Resource
class_name book_quiz

export(String) var book
export(int) var chapter

export(Resource) var question1
export(Resource) var question2
export(Resource) var question3
export(Resource) var question4
export(Resource) var question5
export(Resource) var question6
export(Resource) var question7
export(Resource) var question8
export(Resource) var question9
export(Resource) var question10
export(Resource) var question11
export(Resource) var question12
export(Resource) var question13
export(Resource) var question14
export(Resource) var question15
export(Resource) var question16
export(Resource) var question17
export(Resource) var question18
export(Resource) var question19
export(Resource) var question20
export(Resource) var question21
export(Resource) var question22
export(Resource) var question23
export(Resource) var question24
export(Resource) var question25
export(Resource) var question26

func set_array() -> Array:
	var questions = [
		question1,
		question2,
		question3,
		question4,
		question5,
		question6,
		question7,
		question8,
		question9,
		question10,
		question11,
		question12,
		question13,
		question14,
		question15,
		question16,
		question17,
		question18,
		question19,
		question20,
		question21,
		question22,
		question23,
		question24,
		question25,
		question26
	]
	return questions
