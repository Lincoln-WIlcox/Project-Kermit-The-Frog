extends Node

const SERVER_URL = "ws://localhost:5144/chat"

@onready var hub: HubConnection
@onready var message_board: MessageBoard = $MessageBoard

func _ready():
	hub = HubConnection.new()
	add_child(hub)
	hub.on("ReceiveMessage", func(message_name: String, message_content: String): message_board.post_message(message_name, message_content))
	
	hub.connect_to_url(SERVER_URL)
	await hub.connected
	print("connected!")

func _on_message_board_message_sent(message_name, message_content):
	hub.invoke("SendMessage", [message_name, message_content])
