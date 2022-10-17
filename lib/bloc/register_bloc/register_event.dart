part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterOnLoad extends RegisterEvent {
  String userName;
  String passWord;
  RegisterOnLoad({required this.userName, required this.passWord});

  @override
  List<Object> get props => [];
}
