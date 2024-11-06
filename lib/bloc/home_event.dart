abstract class LoginEvent {}

class LoginRequested extends LoginEvent {
  final String email;
  final String password;

  LoginRequested(this.email, this.password);
}

class RegisterRequested extends LoginEvent {}

class GovernoratesRequested extends LoginEvent {}

class DistrictsRequested extends LoginEvent {}

class FaceBookLoginRequested extends LoginEvent {}

class GoogleLoginRequested extends LoginEvent {}

class GovernoratesSelected extends LoginEvent {
  final String? value;

  GovernoratesSelected(this.value);
}

class DistrictsSelected extends LoginEvent {
  final String? value;

  DistrictsSelected(this.value);
}

class ToggleRememberMe extends LoginEvent {}

class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged(this.email);
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged(this.password);
}

class NameChanged extends LoginEvent {
  final String name;

  NameChanged(this.name);
}

class ToggleEmailVisible extends LoginEvent {}
class TogglePasswordVisible extends LoginEvent {}
class ResetStates extends LoginEvent {}
