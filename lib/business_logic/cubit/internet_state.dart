part of 'connection_cubit.dart';

abstract class ConnectionState{}

class ConnectionLoading extends ConnectionState{}
class ConnectionSuccess extends ConnectionState{}
class ConnectionFailed extends ConnectionState{}