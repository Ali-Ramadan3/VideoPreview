import 'package:equatable/equatable.dart';
import 'package:either_dart/either.dart';
import '../../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
