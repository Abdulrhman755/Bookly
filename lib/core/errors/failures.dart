import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure([List<Object> props = const []]);

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure([List<Object> props = const []]);

  @override
  List<Object?> get props => [];
}



