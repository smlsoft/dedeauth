import 'package:bloc/bloc.dart';
import 'package:dedeauth/struct/register.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dedeauth/repositories/user_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(RegisterInitial()) {
    on<RegisterOnLoad>(_onRegisterLoad);
  }

  void _onRegisterLoad(
      RegisterOnLoad event, Emitter<RegisterState> emit) async {
    emit(RegisterInProgress());
    try {
      final _result =
          await _userRepository.authenUser(event.userName, event.passWord);

      if (_result.success) {
        final appConfig = GetStorage("AppConfig");
        Register userRegister =
            Register(email: event.userName, password: _result.data["token"]);
        appConfig.write("token", _result.data["token"]);
        emit(RegisterSuccess(register: userRegister));
      } else {
        emit(RegisterFailed(message: 'User Not Found'));
      }
    } on Exception catch (exception) {
      emit(RegisterFailed(
          message: 'ลงทะเบียนไม่สำเร็จ : ' + exception.toString()));
    } catch (e) {
      emit(RegisterFailed(message: 'ลงทะเบียนไม่สำเร็จ : ' + e.toString()));
    }
  }
}
