import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_firman/bloc/auth/auth_state.dart';
import 'package:tugas_firman/db/auth_local_storage.dart';
import 'package:tugas_firman/db/remote_data/auth_remote_data.dart';

class AuthCubit extends Cubit<AuthState> {
  late final AuthLocalStorage authLocalStorage;
  late final AuthRemoteData authRemoteData;

  AuthCubit(this.authLocalStorage, this.authRemoteData)
    : super(const AuthState());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(state.copyWith(loading: true, errorMessage: ''));

    try {
      final response = await authRemoteData.postLogin(username, password);
      await authLocalStorage.setToken(response.token ?? '');
      await authLocalStorage.setUser(response.user!);

      emit(
        state.copyWith(loading: false, user: response.user!, isLoggedIn: true),
      );
    } catch (e) {
      emit(state.copyWith(loading: false, errorMessage: "$e"));
    }
  }

  Future<void> register({
    required String username,
    required String password,
  }) async {
    try {
      emit(state.copyWith(loading: true, errorMessage: ''));

      final result = await authRemoteData.postRegister(username, password);

      if (result.success) {
        emit(state.copyWith(loading: false, isLoggedIn: true));
      } else {
        emit(state.copyWith(loading: false, errorMessage: result.message));
      }
    } catch (e) {
      emit(state.copyWith(loading: false, errorMessage: 'Error: $e'));
    }
  }

  bool isLoggedIn() {
    final token = authLocalStorage.getToken();
    if (token?.isEmpty ?? true) {
      return false;
    } else {
      final user = authLocalStorage.getUser();
      if (user != null) {
        emit(state.copyWith(user: user, isLoggedIn: true));
        return true;
      }
      return false;
    }
  }

  Future<void> refreshProfile() async {
    try {
      final token = authLocalStorage.getToken();
      if (token != null) {
        final user = await authRemoteData.getProfile(token);
        await authLocalStorage.setUser(user);
        emit(state.copyWith(user: user));
      }
    } catch (e) {
      print('Error saat refresh profile: $e');
    }
  }

  Future<void> logout() async {
    emit(AuthState.wipe());
    await authLocalStorage.clear();
  }
}