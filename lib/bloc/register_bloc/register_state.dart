part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterInProgress extends RegisterState {}

class RegisterSuccess extends RegisterState {
  Register register;

  RegisterSuccess({
    required this.register,
  });

  @override
  List<Object> get props => [register];
}

class RegisterFailed extends RegisterState {
  final String message;
  RegisterFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
