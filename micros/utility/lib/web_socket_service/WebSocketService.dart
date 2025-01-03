import 'dart:developer';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class WebSocketService {
  static final WebSocketService _instance = WebSocketService._internal();
  IO.Socket? _socket;
  final String _url = "https://api.infogird.com/";
  final String _path = "/prod/api/web-socket";
  bool _isConnected = false;

  WebSocketService._internal();

  factory WebSocketService() {
    return _instance;
  }

  /// Initialize and connect to the Socket.IO server

  void connect(
      {Function()? onConnect,
      Function()? onDisconnect,
      Function(dynamic)? onError,
      Function()? onReconnect,
      Function()? onReconnectAttempt,
      String? path,
      bool isAutoConnect = true}) {
    if (_isConnected) {
      log("WebSocketService: Already connected to the server.");
      return;
    }

    try {
      log("WebSocketService: Connecting to Socket.IO server...");
      // _socket = IO.io("https://api.infogird.com/", <String, dynamic>{
      //   'autoConnect': true,
      //   'transports': ['websocket'],
      //   'path': '/prod/api/web-socket'
      // });
      _socket = IO.io(
        _url,
        isAutoConnect
            ? IO.OptionBuilder()
                .setTransports(['websocket']) // Use WebSocket transport
                .setPath(path ?? _path) // Set the custom path for the socket
                .enableAutoConnect() // Automatically connect
                .setReconnectionDelay(5000)
                .build()
            : IO.OptionBuilder()
                .setTransports(['websocket']) // Use WebSocket transport
                .setPath(path ?? _path) // Set the custom path for the socket
                .setReconnectionDelay(5000) // Set reconnection delay
                .build(),
      );

      _socket!.onConnect((_) {
        log("WebSocketService: Connected to server.");
        _isConnected = true;
        if (onConnect != null) {
          onConnect(); // Execute passed callback if provided
        }
      });

      _socket!.onDisconnect((_) {
        log("WebSocketService: Disconnected from server.");
        _isConnected = false;
        if (onDisconnect != null) {
          onDisconnect(); // Execute passed callback if provided
        }
      });

      _socket!.onError((data) {
        log("WebSocketService: Error: $data");
        if (onError != null) {
          onError(data); // Execute passed callback if provided
        }
      });

      _socket!.onReconnect((_) {
        log("WebSocketService: Reconnected to server.");
        if (onReconnect != null) {
          onReconnect(); // Execute passed callback if provided
        }
      });

      _socket!.onReconnectAttempt((_) {
        log("WebSocketService: Attempting to reconnect...");
        if (onReconnectAttempt != null)
          onReconnectAttempt(); // Execute passed callback if provided
      });
    } catch (e) {
      log("WebSocketService: Error during connection: $e");
    }
  }

  /// Emit an event to the server
  void emit(String event, dynamic data) {
    if (_isConnected && _socket != null) {
      log("WebSocketService: Emitting event '$event' with data: $data");
      _socket!.emit(event, data);
    } else {
      log("WebSocketService: Cannot emit, WebSocket is not connected.");
    }
  }

  /// Listen for a specific event from the server
  void on(String event, Function(dynamic) callback) {
    if (_socket != null) {
      log("WebSocketService: Listening for event '$event'.");
      _socket!.on(event, callback);
    } else {
      log("WebSocketService: Socket is not initialized.");
    }
  }

  /// Disconnect from the server
  void disconnect() {
    if (_isConnected && _socket != null) {
      log("WebSocketService: Disconnecting from server...");
      _socket!.disconnect();
      _isConnected = false;
      log("WebSocketService: Disconnected successfully.");
    } else {
      log("WebSocketService: No active connection to disconnect.");
    }
  }

  /// Check connection status
  bool get isConnected => _isConnected;
}
