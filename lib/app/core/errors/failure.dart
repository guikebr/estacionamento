abstract class Failure implements Exception {
  Failure();

  String? get message;
}

class CachedFailure extends Failure {
  CachedFailure({this.message});

  @override
  final String? message;
}

class InternalError implements Failure {
  InternalError({this.message});

  @override
  final String? message;
}