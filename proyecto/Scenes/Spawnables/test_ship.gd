extends RigidBody2D
class_name TestShip

static var Instance: TestShip;
@export var speed: float;


func _ready() -> void:
	Instance = self;

func destroy():
	print("destroyed");
	Instance = null;
	queue_free();

func _physics_process(_delta: float) -> void:
	var dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down");
	apply_force(speed * dir);