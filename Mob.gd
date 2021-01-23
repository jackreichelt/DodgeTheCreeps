extends RigidBody2D

export var min_speed = 150  # Minimum speed range.
export var max_speed = 250  # Maximum speed range.

func _ready():
  var mob_types = $AnimatedSprite.frames.get_animation_names()
  $AnimatedSprite.animation = mob_types[randi() % mob_types.size()]
  
  $VisibilityNotifier2D.connect("screen_exited", self, "_exited_screen")
  
func _exited_screen():
  queue_free()
