import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call({required Params params});
}

class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}
