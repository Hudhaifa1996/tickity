class LoginState {
  final String email;
  final String password;
  final String? governorateValue;
  final String? districtValue;
  final String name;
  final String authAuthenticated;
  final String authError;
  final bool rememberMe;
  final bool emailVisible;
  final bool passwordVisible;
  final bool isnullEmail;
  final bool isnullPassword;
  final bool isnullName;
  final bool isLoading;
  final bool isLoadingFaceBook;
  final bool isLoadingGoogle;
  final List<dynamic> governoratesNames;
  final List<dynamic> districtsNames;


  LoginState({
    this.email = '',
    this.password = '',
    this.governorateValue,
    this.districtValue,
    this.name = '',
    this.authAuthenticated = '',
    this.authError = '',
    this.rememberMe = false,
    this.emailVisible = false,
    this.passwordVisible = true,
    this.isnullEmail = true,
    this.isnullPassword = true,
    this.isnullName = true,
    this.isLoading = false,
    this.isLoadingFaceBook = false,
    this.isLoadingGoogle = false,
    this.governoratesNames = const [] ,
    this.districtsNames = const [] ,
  });

  bool get isEmailValid => email.contains(RegExp(r'^[^@]+@[^@]+\.[^@]+'));

  bool get isPasswordValid => password.length >= 6;

  LoginState copyWith({
    String? email,
    String? password,
    String? governorateValue,
    String? districtValue,
    String? name,
    String? authAuthenticated,
    String? authError,
    bool? rememberMe,
    bool? emailVisible,
    bool? passwordVisible,
    bool? isnullEmail,
    bool? isnullPassword,
    bool? isnullName,
    bool? isLoading,
    bool? isLoadingFaceBook,
    bool? isLoadingGoogle,
    List<dynamic>? governoratesNames,
    List<dynamic>? districtsNames,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      governorateValue: governorateValue ?? this.governorateValue,
      districtValue: districtValue ?? this.districtValue,
      name: name ?? this.name,
      authAuthenticated: authAuthenticated ?? this.authAuthenticated,
      authError: authError ?? this.authError,
      rememberMe: rememberMe ?? this.rememberMe,
      emailVisible: emailVisible ?? this.emailVisible,
      passwordVisible: passwordVisible ?? this.passwordVisible,
      isnullEmail: isnullEmail ?? this.isnullEmail,
      isnullPassword: isnullPassword ?? this.isnullPassword,
      isnullName: isnullName ?? this.isnullName,
      isLoading: isLoading ?? this.isLoading,
      isLoadingFaceBook: isLoadingFaceBook ?? this.isLoadingFaceBook,
      isLoadingGoogle: isLoadingGoogle ?? this.isLoadingGoogle,
      governoratesNames: governoratesNames ?? this.governoratesNames,
      districtsNames: districtsNames ?? this.districtsNames,
    );
  }
}
