class_name MessageBoard extends Control

@export var message_board_message_packed_scene: PackedScene
@onready var messages_container: VBoxContainer = %MessagesContainer
@onready var message_name_field: TextEdit = %MessageNameField
@onready var message_content_field: TextEdit = %MessageContentField
@onready var scroll_container: ScrollContainer = %ScrollContainer

signal message_sent(message_name: String, message_content: String)

func post_message(message_name: String, message_content: String) -> void:
	var message_board_message: MessageBoardMessage = message_board_message_packed_scene.instantiate()
	messages_container.add_child(message_board_message)
	message_board_message.set_labels.call_deferred(message_name, message_content)

func _on_send_button_pressed():
	var message_name: String = message_name_field.text
	var message_content: String = message_content_field.text
	message_sent.emit(message_name, message_content)
	#.set_deferred.call_deferred lmao
	scroll_container.get_v_scroll_bar().set_deferred.call_deferred("value", scroll_container.get_v_scroll_bar().max_value)
