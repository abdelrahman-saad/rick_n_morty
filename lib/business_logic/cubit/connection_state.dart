part of 'connection_cubit.dart';
enum ConnectionStatus{
  online,
  offline
}
class ConnectionState{
  ConnectionStatus connectionStatus;
  ConnectionState({required this.connectionStatus});
}