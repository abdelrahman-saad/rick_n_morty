import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event != ConnectivityResult.none) {
        emitInternetConnected();
      } else {
        emitInternetFailed();
      }
    });
  }

  void emitInternetConnected() => emit(InternetSuccess());

  void emitInternetFailed()=>emit(InternetFailed());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
