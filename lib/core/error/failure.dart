import 'package:equatable/equatable.dart';
import '../presentation/constant/constant.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class FailureToMassage {
  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Constant.serverFailureMessage;
      case CacheFailure:
        return Constant.cacheFailureMessage;
      case NetworkFailure:
        return Constant.networkFailureMessage;
      default:
        return 'Unexpected error';
    }
  }
}
