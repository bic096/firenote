part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState(
      {required EmailAddress emailAddress,
      required Password password,
      required bool isSubmitting,
      required bool showErrorMesseges,
      required Option<Either<AuthFailure, Unit>>
          authFailureOrSuccessOption}) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
      emailAddress: EmailAddress(''),
      password: Password(''),
      isSubmitting: false,
      showErrorMesseges: false,
      authFailureOrSuccessOption: none());
}
