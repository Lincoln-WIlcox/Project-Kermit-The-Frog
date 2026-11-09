class_name MessageBoardMessage extends HBoxContainer

@onready var name_label: Label = %NameLabel
@onready var message_label: Label = %MessageLabel

func set_labels(message_name: String, message_content: String) -> void:
	name_label.text = message_name
	message_label.text = message_content
