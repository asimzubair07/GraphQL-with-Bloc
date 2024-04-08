import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketService {
  static Socket? _socket;

  

  static SocketService? _instance;

  static SocketService? get instance {
    _instance ??= SocketService();
    return _instance;
  }

  Socket? get socket => _socket;

  void initializeSocket() {
    _socket = io(dotenv.get('BASE_URL'), <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
  }

  void connectSocket() {
    _socket?.connect();

    _socket?.on("connect", (data) {
      log('Connected socket ');
    });

    _socket?.on("disconnect", (data) {
      log('Disconnected $data');
    });

    _socket?.on("connect_error", (data) {
      log('Connect Error $data');
    });

    _socket?.on("error", (data) {
      log('Error $data');
    });
  }

  void socketEmitMethod(
      {required String eventName, required dynamic eventParamaters}) {
    _socket?.emit(
      eventName,
      eventParamaters,
    );
  }

  void socketSendEmitMethod(
      {required String eventName, required dynamic eventParamaters}) {
    _socket?.emit(
      eventName,
      eventParamaters,
    );
  }

  socketResponseMethod(Function(dynamic data) onResponse) {
    _socket?.on("response", (data) {
      onResponse(data);
    });
  }

  void appendSingleChat({dynamic singleData}) {
    if (singleData != null) {}
  }

  void dispose() {
    _socket?.dispose();
  }
}
