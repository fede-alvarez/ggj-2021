extends Position2D

var rand = RandomNumberGenerator.new()

func _ready():
	rand.randomize()
	hide_all()

func hide_all():
	for item in get_children():
		item.visible = false
		
func show_random_positive():
	hide_all()
	var options_num = get_child_count()
	var random_cons = rand.randi_range(0, options_num-1)
	get_child(random_cons).visible = true
