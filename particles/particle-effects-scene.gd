extends Node3D

@onready var labelVisibleEffects = %LabelVisibleEffects
@onready var buttonSmoke = %ButtonSmoke
@onready var effectsContainer = %Effects
@onready var sideBarMenu = $"CanvasLayer UI/SideBar/SideBar Menu"
@onready var camera = %Camera3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func updateVisibleEffects():
	var pressedButton = buttonSmoke.button_group.get_pressed_button()
	var effect = get_node("Effects/" + pressedButton.text.strip_edges())

	for child in effectsContainer.get_children():
		if child == effect:
			child.show()
		else:
			child.hide()

	labelVisibleEffects.text = "[center]" + pressedButton.text


func toggleSideBar():
	if sideBarMenu.visible: # Replace with function body.
		sideBarMenu.hide()
	else:
		sideBarMenu.show()
	


func slider_camera_zoom_value_changed(value):
	camera.size = 10 - value
