extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	clear()
	append_text(str(int(Global.score)))
