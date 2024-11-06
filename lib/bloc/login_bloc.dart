import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../API/api.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());
  API api = API();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      if (event.email == "") {
        yield state.copyWith(isnullEmail: true);
      } else {
        yield state.copyWith(isnullEmail: false);
      }
      yield state.copyWith(email: event.email);
    } else if (event is PasswordChanged) {
      if (event.password == "") {
        yield state.copyWith(isnullPassword: true);
      } else {
        yield state.copyWith(isnullPassword: false);
      }
      yield state.copyWith(password: event.password);
    } else if (event is NameChanged) {
      if (event.name == "") {
        yield state.copyWith(isnullName: true);
      } else {
        yield state.copyWith(isnullName: false);
      }
      yield state.copyWith(name: event.name);
    } else if (event is ToggleRememberMe) {
      yield state.copyWith(rememberMe: !state.rememberMe);
    } else if (event is ToggleEmailVisible) {
      yield state.copyWith(emailVisible: !state.emailVisible);
    } else if (event is TogglePasswordVisible) {
      yield state.copyWith(passwordVisible: !state.passwordVisible);
    } else if (event is ResetStates) {
      yield state.copyWith(
        email: '',
        password: '',
        governorateValue: null,
        districtValue: null,
        name: '',
        rememberMe: false,
        emailVisible: false,
        passwordVisible: true,
        isnullEmail: true,
        isnullPassword: true,
        isnullName: true,
      );
    } else if (event is LoginRequested) {
      yield state.copyWith(isLoading: true);
      // Login API
      await Future.delayed(const Duration(seconds: 2));
      yield state.copyWith(isLoading: false);
    } else if (event is RegisterRequested) {
      yield state.copyWith(isLoading: true);
      // Register API
      await Future.delayed(const Duration(seconds: 2));
      yield state.copyWith(isLoading: false);
    } else if (event is FaceBookLoginRequested) {
      yield state.copyWith(isLoadingFaceBook: true);
      const facebookUser = null; //await api.signInWithFacebook();
      if (facebookUser != null) {
        yield state.copyWith(authAuthenticated: "Facebook User");
      } else {
        yield state.copyWith(authError: "Facebook Sign-In Failed");
      }
      yield state.copyWith(isLoadingFaceBook: false);
    } else if (event is GoogleLoginRequested) {
      yield state.copyWith(isLoadingGoogle: true);
      final googleUser = await api.signInWithGoogle();
      if (googleUser != null) {
        yield state.copyWith(authAuthenticated:googleUser.displayName ?? "Google User");
      } else {
        yield state.copyWith(authError: "Google Sign-In Failed");
      }
      yield state.copyWith(isLoadingGoogle: false);
    } else if (event is GovernoratesSelected) {
      yield state.copyWith(governorateValue: event.value);
    } else if (event is DistrictsSelected) {
      yield state.copyWith(districtValue: event.value);
    } else if (event is GovernoratesRequested) {
      Response response = await api.governorates();
      List<dynamic> responseData = response.data;
      yield state.copyWith(governoratesNames: responseData);
    } else if (event is DistrictsRequested) {
      Response response =
          await api.governorates(); // should be changed to districts api
      List<dynamic> responseData = response.data;
      yield state.copyWith(districtsNames: responseData);
    }
  }
}
