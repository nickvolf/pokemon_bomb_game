extends Node


export(Resource) var test1_1
export(Resource) var test1_2
export(Resource) var test1_3
export(Resource) var test1_4
export(Resource) var test1_5
export(Resource) var test1_6
export(Resource) var test1_7
export(Resource) var test1_8
export(Resource) var test1_9

export(Resource) var test2_1
export(Resource) var test2_2
export(Resource) var test2_3
export(Resource) var test2_4
export(Resource) var test2_5
export(Resource) var test2_6
export(Resource) var test2_7
export(Resource) var test2_8
export(Resource) var test2_9

export(Resource) var test3_1
export(Resource) var test3_2
export(Resource) var test3_3
export(Resource) var test3_4
export(Resource) var test3_5
export(Resource) var test3_6
export(Resource) var test3_7
export(Resource) var test3_8
export(Resource) var test3_9

export(Resource) var test4_1
export(Resource) var test4_2
export(Resource) var test4_3
export(Resource) var test4_4
export(Resource) var test4_5
export(Resource) var test4_6
export(Resource) var test4_7
export(Resource) var test4_8
export(Resource) var test4_9

export(Resource) var test5_1
export(Resource) var test5_2
export(Resource) var test5_3
export(Resource) var test5_4
export(Resource) var test5_5
export(Resource) var test5_6
export(Resource) var test5_7
export(Resource) var test5_8
export(Resource) var test5_9

export(Resource) var test6_1
export(Resource) var test6_2
export(Resource) var test6_3
export(Resource) var test6_4
export(Resource) var test6_5
export(Resource) var test6_6
export(Resource) var test6_7
export(Resource) var test6_8
export(Resource) var test6_9

var all_tests: Array = []


# Called when the node enters the scene tree for the first time.
func _ready():
	all_tests = [
		test1_1,
		test1_2,
		test1_3,
		test1_4,
		test1_5,
		test1_6,
		test1_7,
		test1_8,
		test1_9,
		test2_1,
		test2_2,
		test2_3,
		test2_4,
		test2_5,
		test2_6,
		test2_7,
		test2_8,
		test2_9,
		test3_1,
		test3_2,
		test3_3,
		test3_4,
		test3_5,
		test3_6,
		test3_7,
		test3_8,
		test3_9,
		test4_1,
		test4_2,
		test4_3,
		test4_4,
		test4_5,
		test4_6,
		test4_7,
		test4_8,
		test4_9,
		test5_1,
		test5_2,
		test5_3,
		test5_4,
		test5_5,
		test5_6,
		test5_7,
		test5_8,
		test5_9,
		test6_1,
		test6_2,
		test6_3,
		test6_4,
		test6_5,
		test6_6,
		test6_7,
		test6_8,
		test6_9,
	]
	for book in all_tests:
		book.set_array()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
