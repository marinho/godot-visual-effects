extends Node3D

@onready var labelVisibleEffects = %LabelVisibleEffects

@onready var buttonRotatingCamera = %ButtonRotatingCamera
@onready var buttonChromaticAberration = %ButtonChromaticAberration
@onready var buttonPixelate = %ButtonPixelate
@onready var buttonVignette = %ButtonVignette
@onready var buttonSepia = %ButtonSepia
@onready var buttonGrainNoise = %ButtonGrainNoise
@onready var buttonHexagonMosaic = %ButtonHexagonMosaic
@onready var buttonCameraShake = %ButtonCameraShake

@onready var effectChromaticAberration = $"CanvasLayer Effects/Chromatic Aberration"
@onready var effectPixelate = $"CanvasLayer Effects/Pixelate"
@onready var effectVignette = $"CanvasLayer Effects/Vignette"
@onready var effectSepia = $"CanvasLayer Effects/Sepia"
@onready var effectGrainNoise = $"CanvasLayer Effects/Grain Noise"
@onready var effectHexagonMosaic = $"CanvasLayer Effects/Hexagon Mosaic"
@onready var effectCameraShake = $"CanvasLayer Effects/Camera Shake"

@onready var animationPlayer = $AnimationPlayer
@onready var sideBarMenu = $"CanvasLayer UI/SideBar/SideBar Menu"

var cameraRotatingAnimationName = "camera_rotation"

# Called when the node enters the scene tree for the first time.
func _ready():
	animationPlayer.play(cameraRotatingAnimationName)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func updateVisibleEffects(toggled_on):
	effectChromaticAberration.visible = buttonChromaticAberration.button_pressed
	effectPixelate.visible = buttonPixelate.button_pressed
	effectVignette.visible = buttonVignette.button_pressed
	effectSepia.visible = buttonSepia.button_pressed
	effectGrainNoise.visible = buttonGrainNoise.button_pressed
	effectHexagonMosaic.visible = buttonHexagonMosaic.button_pressed
	effectCameraShake.visible = buttonCameraShake.button_pressed
	updateEffectsLabel()

func disableAllEffects():
	buttonChromaticAberration.button_pressed = false
	buttonPixelate.button_pressed = false
	buttonVignette.button_pressed = false
	buttonSepia.button_pressed = false
	buttonGrainNoise.button_pressed = false
	buttonHexagonMosaic.button_pressed = false
	buttonCameraShake.button_pressed = false
	updateEffectsLabel()


func updateEffectsLabel():
	var textParts = [
		"Chromatic Aberration" if buttonChromaticAberration.button_pressed else "",
		"Pixelate" if buttonPixelate.button_pressed else "",
		"Vignette" if buttonVignette.button_pressed else "",
		"Sepia" if buttonSepia.button_pressed else "",
		"Grain Noise" if buttonGrainNoise.button_pressed else "",
		"Hexagon Mosaic" if buttonHexagonMosaic.button_pressed else "",
		"Camera Shake" if buttonCameraShake.button_pressed else "",
	]
	var text = " ".join(textParts)
	labelVisibleEffects.text = "[center]" + text


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
