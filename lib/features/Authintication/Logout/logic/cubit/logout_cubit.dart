import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/Helpers/cache_helper.dart';
import '../../../../../core/Networking/api_constants.dart';
import '../../data/repos/logout_repo.dart';
import 'logout_state.dart';
class LogoutCubit extends Cubit<LogoutState> {
  final LogoutRepo _logoutRepo;


  LogoutCubit(this._logoutRepo) : super(const LogoutState.initial());

  void emitLoginStates() async {
    emit(const LogoutState.loading());
    final  response = await _logoutRepo.logout();
    response.when(
      success: (logoutResponse) async {
        CacheHelper.sharedPreferences.remove(ApiConstants.token);
        emit(LogoutState.success(logoutResponse));
      },
      failure: (error) {
        emit(LogoutState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}