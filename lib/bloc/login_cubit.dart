import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../API/api.dart';
import '../di_container.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
  API api = locator<API>();

  void emailChanged(String email) {
    emit(state.copyWith(email: email, isEmailEmpty: false));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password, isPasswordEmpty: false));
  }

  void toggleRememberMe() {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }

  Future<void> loginRequested() async {
    emit(state.copyWith(isLoading: true));
    // Login API
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isLoading: false));
  }

  void toggleEmailVisible() {
    // state is LoginChanged ?
    emit(state.copyWith(emailVisible: !state.emailVisible));
    // : emit(Signup(emailVisible: !(state as Signup).emailVisible));
  }

  void togglePasswordVisible() {
    // state is LoginChanged ?
    emit(state.copyWith(passwordVisible: !state.passwordVisible));
    // : emit(Signup(passwordVisible: !(state as Signup).passwordVisible));
  }

//   void nameChanged(String name) {
//     emit(Signup(name: name));
//   }
//
//   void governoratesSelected(String value) {
//     emit(Signup(governorateValue: value));
//   }
//
//   Future<void> governoratesRequested() async {
//     Response response = await api.governorates();
//     List<dynamic> responseData = response.data;
//     emit(Signup(governoratesNames: responseData));
//   }
//
//   Future<void> districtsRequested() async {
//     Response response = await api.governorates();
//     List<dynamic> responseData = response.data;
//     emit(Signup(districtsNames: responseData));
//   }
//
//   void districtsSelected(String value) {
//     emit(Signup(districtValue: value));
//   }
//
// Future<void> registerRequested() async {
//   emit(Signup(isLoading: true));
//   // Register API
//   await Future.delayed(const Duration(seconds: 2));
//   emit(Signup(isLoading: false));
// }
//
//   Future<void> googleLoginRequested() async {
//     emit(Google(isLoading: true));
//     final googleUser = await api.signInWithGoogle();
//     if (googleUser != null) {
//       emit(Google(authAuthenticated: googleUser.displayName ?? "Google User"));
//     } else {
//       emit(Google(authError: "Google Sign-In Failed"));
//     }
//     emit(Google(isLoading: false));
//   }
//
//   Future<void> faceBookLoginRequested() async {
//     emit(Facebook(isLoading: true));
//     const facebookUser = null; //await api.signInWithFacebook();
//     if (facebookUser != null) {
//       emit(Facebook(authAuthenticated: "Facebook User"));
//     } else {
//       emit(Facebook(authError: "Facebook Sign-In Failed"));
//     }
//     emit(Facebook(isLoading: false));
//   }
}
