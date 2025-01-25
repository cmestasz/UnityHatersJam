extends Spawnable
class_name CollapsedBuilding

static var pre := preload("res://Scenes/Spawnables/CollapsedBuilding.tscn");
var initial_pos: Vector2;
@export var speed: float;
var velocity: Vector2;
var dir: Vector2;
var falling := false;

static func _spawn(pos: Vector2):
	var instance = pre.instantiate() as CollapsedBuilding;
	instance.initial_pos = pos;
	return instance;

func _physics_process(delta: float) -> void:
	if falling:
		position += velocity * delta;

func _ready() -> void:
	var window_height = get_viewport_rect().size.y;
	var y_pos = -window_height / 2;
	var valid_pos = Vector2(initial_pos.x, y_pos);
	position = valid_pos;

	var valid_dir = Vector2.DOWN;
	dir = valid_dir;
	velocity = valid_dir * speed;

	_post_spawn();

func _on_detect_area_body_entered(body: Node2D) -> void:
	if (body is TestShip):
		falling = true;