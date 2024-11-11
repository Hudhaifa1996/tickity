import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../API/api.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super (const SignupState());
  API api = API();

  void emailChanged(String email) {
    emit(state.copyWith(email: email, isEmailEmpty: false));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password, isPasswordEmpty: false));
  }


  void toggleEmailVisible() {
    emit(state.copyWith(emailVisible: !state.emailVisible));
  }

  void togglePasswordVisible() {
    emit(state.copyWith(passwordVisible: !state.passwordVisible));
  }

  void nameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void governoratesSelected(String value) {
    emit(state.copyWith(governorateValue: value));
  }

  Future<void> governoratesRequested() async {
    List<dynamic> responseData = await api.governorates();
    emit(state.copyWith(governoratesNames: responseData));
  }

  Future<void> districtsRequested() async {
    List<dynamic> responseData = await api.governorates();
    emit(state.copyWith(districtsNames: responseData));
  }

  void districtsSelected(String value) {
    emit(state.copyWith(districtValue: value));
  }

Future<void> registerRequested() async {
  emit(state.copyWith(isLoading: true));
  // Register API
  await Future.delayed(const Duration(seconds: 2));
  emit(state.copyWith(isLoading: false));
}

  Future<void> googleLoginRequested() async {
    emit(state.copyWith(isLoadingGoogle: true));
    final googleUser = await api.signInWithGoogle();
    if (googleUser != null) {
      emit(state.copyWith(authAuthenticated: googleUser.displayName ?? "Google User"));
    } else {
      emit(state.copyWith(authError: "Google Sign-In Failed"));
    }
    emit(state.copyWith(isLoadingGoogle: false));
  }

  Future<void> faceBookLoginRequested() async {
    emit(state.copyWith(isLoadingFacebook: true));
    const facebookUser = null; //await api.signInWithFacebook();
    if (facebookUser != null) {
      emit(state.copyWith(authAuthenticated: "Facebook User"));
    } else {
      emit(state.copyWith(authError: "Facebook Sign-In Failed"));
    }
    emit(state.copyWith(isLoadingFacebook: false));
  }

}