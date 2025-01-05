import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;
  final StreamController<Map<String, dynamic>> _dataController = StreamController.broadcast();

  Stream<Map<String, dynamic>> get dataStream => _dataController.stream;

  // Initialize the socket connection
  void initializeSocket() {
    // Create the socket connection using the dummy URL
    socket = IO.io(
      'http://dummy-socket-server.com', // Dummy URL for testing
      IO.OptionBuilder()
          .setTransports(['websocket']) // Use WebSocket for connection
          .build(),
    );

    // Handle socket events
    socket.onConnect((_) {
      print('Connected to the dummy socket server');
    });

    socket.on('stock_update', (data) {
      // This will be triggered when the server sends a 'stock_update' event
      print('Received stock update: $data');
      _dataController.sink.add(data); // Push data to the stream
    });

    socket.onDisconnect((_) {
      print('Disconnected from dummy socket server');
    });

    socket.onError((error) {
      print('Socket error: $error');
    });
  }

  // Close the socket connection
  void closeSocket() {
    socket.disconnect();
    _dataController.close(); // Close the stream controller
    print('Socket disconnected');
  }
}
