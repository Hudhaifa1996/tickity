part of 'signup_cubit.dart';

@immutable
class SignupState {
  final String email;
  final String password;
  final String? governorateValue;
  final String? districtValue;
  final String name;
  final bool emailVisible;
  final bool passwordVisible;
  final bool isEmailEmpty;
  final bool isPasswordEmpty;
  final bool isNameEmpty;
  final bool isLoading;
  final List<dynamic> governoratesNames;
  final List<dynamic> districtsNames;
  final String authAuthenticated;
  final String authError;
  final bool isLoadingGoogle;
  final bool isLoadingFacebook;

  const SignupState({
    this.email = '',
    this.password = '',
    this.governorateValue,
    this.districtValue,
    this.name = '',
    this.emailVisible = false,
    this.passwordVisible = true,
    this.isEmailEmpty = true,
    this.isPasswordEmpty = true,
    this.isNameEmpty = true,
    this.isLoading = false,
    this.governoratesNames = const [],
    this.districtsNames = const [],
    this.authAuthenticated = '',
    this.authError = '',
    this.isLoadingGoogle = false,
    this.isLoadingFacebook = false,
  });

  bool get isEmailValid => email.contains(RegExp(r'^[^@]+@[^@]+\.[^@]+'));

  bool get isPasswordValid => password.length >= 6;

  SignupState copyWith({
    String? email,
    String? password,
    String? governorateValue,
    String? districtValue,
    String? name,
    bool? rememberMe,
    bool? emailVisible,
    bool? passwordVisible,
    bool? isEmailEmpty,
    bool? isPasswordEmpty,
    bool? isNameEmpty,
    bool? isLoading,
    List<dynamic>? governoratesNames,
    List<dynamic>? districtsNames,
    String? authAuthenticated,
    String? authError,
    bool? isLoadingGoogle,
    bool? isLoadingFacebook,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      governorateValue: governorateValue ?? this.governorateValue,
      districtValue: districtValue ?? this.districtValue,
      name: name ?? this.name,
      emailVisible: emailVisible ?? this.emailVisible,
      passwordVisible: passwordVisible ?? this.passwordVisible,
      isEmailEmpty: isEmailEmpty ?? this.isEmailEmpty,
      isPasswordEmpty: isPasswordEmpty ?? this.isPasswordEmpty,
      isNameEmpty: isNameEmpty ?? this.isNameEmpty,
      isLoading: isLoading ?? this.isLoading,
      governoratesNames: governoratesNames ?? this.governoratesNames,
      districtsNames: districtsNames ?? this.districtsNames,
      authAuthenticated: authAuthenticated ?? this.authAuthenticated,
      authError: authError ?? this.authError,
      isLoadingGoogle: isLoadingGoogle ?? this.isLoadingGoogle,
      isLoadingFacebook: isLoadingFacebook ?? this.isLoadingFacebook,
    );
  }
}
