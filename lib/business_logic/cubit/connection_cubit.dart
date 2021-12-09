import 'package:bloc/bloc.dart';

part 'connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionState> {
  ConnectionCubit(ConnectionState initialState)
      : super(ConnectionState(connectionStatus: ConnectionStatus.offline));

}
