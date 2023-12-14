extends Node3D

@onready var labelVisibleEffects = %LabelVisibleEffects

@onready var buttonRotatingCamera = %ButtonRotatingCamera
@onready var buttonPixelate = %ButtonPixelate

@onready var animationPlayer = $AnimationPlayer
@onready var sideBarMenu = $"CanvasLayer UI/SideBar/SideBar Menu"
@onready var effectsContainer = %Effects

var cameraRotatingAnimationName = "camera_rotation"

# Called when the node enters the scene tree for the first time.
func _ready():
	animationPlayer.play(cameraRotatingAnimationName)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func updateVisibleEffects(toggled_on = true):
	var pressedButton = buttonPixelate.button_group.get_pressed_button()
	var effect = get_node_or_null("Effects/" + pressedButton.text.strip_edges())

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


func toggleCameraRotating():
	if buttonRotatingCamera.button_pressed: # Replace with function body.
		animationPlayer.play()
	else:
		animationPlayer.pause()
