
import socket
import threading


def receive_messages(client_socket):
    while True:
        try:
            message = client_socket.recv(1024).decode()

            if not message:
                print("Disconnected from server.")
                break

            print(message)

        except Exception as e:
            print(f"Error receiving message: {e}")
            break


def chat_client():
    # Create TCP socket
    client_socket = socket.socket(
        socket.AF_INET,
        socket.SOCK_STREAM
    )

    try:
        # Connect to the chat server
        client_socket.connect(("127.0.0.1", 55555))
        print("Connected to chat server.")

    except Exception as e:
        print(f"Unable to connect: {e}")
        client_socket.close()
        return

    # Create a separate thread for receiving messages
    receive_thread = threading.Thread(
        target=receive_messages,
        args=(client_socket,),
        daemon=True
    )

    receive_thread.start()

    # Send messages to server
    while True:
        try:
            message = input("Enter message (type 'exit' to quit): ")

            if message.lower() == "exit":
                break

            client_socket.sendall(message.encode())

        except Exception as e:
            print(f"Error sending message: {e}")
            break

    # Close socket
    client_socket.close()
    print("Disconnected from chat server.")


if __name__ == "__main__":
    chat_client()