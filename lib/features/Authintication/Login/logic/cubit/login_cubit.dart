
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/Helpers/cache_helper.dart';
import '../../../../../core/Networking/api_constants.dart';
import '../../data/models/login_request_body.dart';
import '../../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final  response = await _loginRepo.login(
        LoginRequestBody(
          username: usernameController.text,
          password: passwordController.text,
        )
    );
    response.when(
      success: (loginResponse) async {
        await CacheHelper.saveString(ApiConstants.token,loginResponse.accessToken!);
        ApiConstants.tokenvalue=loginResponse.accessToken!;
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}