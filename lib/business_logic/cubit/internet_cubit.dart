import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  ConnectionCubit({required this.connectivity})
      : super(ConnectionLoading()) {
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((event) {
      if(event == ConnectivityResult.none){
        emit(ConnectionSuccess());
      }else{
        emit(ConnectionFailed());
      }
    });


  }
  @override
  Future<void> close(){
    connectivityStreamSubscription.cancel();
    return super.close();
  }

}
