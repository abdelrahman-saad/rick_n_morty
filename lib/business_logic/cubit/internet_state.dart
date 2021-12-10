part of 'internet_cubit.dart';

abstract class InternetState{}

class InternetLoading extends InternetState{}
class InternetSuccess extends InternetState{}
class InternetFailed extends InternetState{}