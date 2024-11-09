part of 'login_cubit.dart';

@immutable
class LoginState {
  final String email;
  final String password;
  final bool rememberMe;
  final bool emailVisible;
  final bool passwordVisible;
  final bool isEmailEmpty;
  final bool isPasswordEmpty;
  final bool isLoading;

  const LoginState({
    this.email = '',
    this.password = '',
    this.rememberMe = false,
    this.emailVisible = false,
    this.passwordVisible = true,
    this.isEmailEmpty = true,
    this.isPasswordEmpty = true,
    this.isLoading = false,
  });

  bool get isEmailValid => email.contains(RegExp(r'^[^@]+@[^@]+\.[^@]+'));

  bool get isPasswordValid => password.length >= 6;

  LoginState copyWith({
    String? email,
    String? password,
    bool? rememberMe,
    bool? emailVisible,
    bool? passwordVisible,
    bool? isEmailEmpty,
    bool? isPasswordEmpty,
    bool? isLoading,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      emailVisible: emailVisible ?? this.emailVisible,
      passwordVisible: passwordVisible ?? this.passwordVisible,
      isEmailEmpty: isEmailEmpty ?? this.isEmailEmpty,
      isPasswordEmpty: isPasswordEmpty ?? this.isPasswordEmpty,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
//
// class Signup extends LoginState {
//   final String email;
//   final String password;
//   final String? governorateValue;
//   final String? districtValue;
//   final String name;
//   final bool emailVisible;
//   final bool passwordVisible;
//   final bool isnullEmail;
//   final bool isnullPassword;
//   final bool isnullName;
//   final bool isLoading;
//   final List<dynamic> governoratesNames;
//   final List<dynamic> districtsNames;
//
//
//   Signup({
//     this.email = '',
//     this.password = '',
//     this.governorateValue,
//     this.districtValue,
//     this.name = '',
//     this.emailVisible = false,
//     this.passwordVisible = true,
//     this.isnullEmail = true,
//     this.isnullPassword = true,
//     this.isnullName = true,
//     this.isLoading = false,
//     this.governoratesNames = const [] ,
//     this.districtsNames = const [] ,
//   });
//
//   bool get isEmailValid => email.contains(RegExp(r'^[^@]+@[^@]+\.[^@]+'));
//
//   bool get isPasswordValid => password.length >= 6;
//
//   Signup copyWith({
//     String? email,
//     String? password,
//     String? governorateValue,
//     String? districtValue,
//     String? name,
//     bool? rememberMe,
//     bool? emailVisible,
//     bool? passwordVisible,
//     bool? isnullEmail,
//     bool? isnullPassword,
//     bool? isnullName,
//     bool? isLoading,
//     List<dynamic>? governoratesNames,
//     List<dynamic>? districtsNames,
//   }) {
//     return Signup(
//       email: email ?? this.email,
//       password: password ?? this.password,
//       governorateValue: governorateValue ?? this.governorateValue,
//       districtValue: districtValue ?? this.districtValue,
//       name: name ?? this.name,
//       emailVisible: emailVisible ?? this.emailVisible,
//       passwordVisible: passwordVisible ?? this.passwordVisible,
//       isnullEmail: isnullEmail ?? this.isnullEmail,
//       isnullPassword: isnullPassword ?? this.isnullPassword,
//       isnullName: isnullName ?? this.isnullName,
//       isLoading: isLoading ?? this.isLoading,
//       governoratesNames: governoratesNames ?? this.governoratesNames,
//       districtsNames: districtsNames ?? this.districtsNames,
//     );
//   }
// }
//
// class Google extends LoginState {
//   final String authAuthenticated;
//   final String authError;
//   final bool isLoading;
//
//   Google({
//     this.isLoading = false,
//     this.authAuthenticated = '',
//     this.authError = '',
//   });
//
//   Google copyWith({
//     bool? isLoading,
//     String? authAuthenticated,
//     String? authError,
//   }) {
//     return Google(
//       isLoading: isLoading ?? this.isLoading,
//       authAuthenticated: authAuthenticated ?? this.authAuthenticated,
//       authError: authError ?? this.authError,
//     );
//   }
// }
// class Facebook extends LoginState {
//   final String authAuthenticated;
//   final String authError;
//   final bool isLoading;
//
//   Facebook({
//     this.isLoading = false,
//     this.authAuthenticated = '',
//     this.authError = '',
//   });
//
//   Facebook copyWith({
//     bool? isLoading,
//     String? authAuthenticated,
//     String? authError,
//   }) {
//     return Facebook(
//       isLoading: isLoading ?? this.isLoading,
//       authAuthenticated: authAuthenticated ?? this.authAuthenticated,
//       authError: authError ?? this.authError,
//     );
//   }
// }
