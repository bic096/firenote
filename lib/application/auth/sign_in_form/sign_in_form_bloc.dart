import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:notefire/domain/auth/i_auth_facade.dart';
import 'package:notefire/domain/auth/value_objects.dart';

import '../../../domain/auth/auth_failure.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _iAuthFacade;

  SignInFormBloc(this._iAuthFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
      await event.map(
        emailChanged: (e) {
          emit(state.copyWith(
              emailAddress: EmailAddress(e.emailStr),
              authFailureOrSuccessOption: none()));
        },
        passwordChanged: (e) {
          emit(state.copyWith(
              password: Password(e.passwordStr),
              authFailureOrSuccessOption: none()));
        },
        signInWithGooglePressed: (e) async {
          emit(state.copyWith(
              isSubmitting: true, authFailureOrSuccessOption: none()));
          final failureOrSuccess = await _iAuthFacade.signInWithGoogle();
          emit(state.copyWith(
              isSubmitting: false,
              authFailureOrSuccessOption: some(failureOrSuccess)));
        },
        registerWithEmailAndPasswordPressed: (e) async {
          await _performActionOnAuthFacadeWithEmailAndPassword(
              event, emit, _iAuthFacade.registerWithEmailAndPassword);
        },
        signInWithEmailAndPasswordPressed: (e) async {
          await _performActionOnAuthFacadeWithEmailAndPassword(
              event, emit, _iAuthFacade.signInWithEmailAndPassword);
        },
      );
    });
  }

  Future<void> _performActionOnAuthFacadeWithEmailAndPassword<SignInFormEvent>(
      SignInFormEvent event,
      Emitter<SignInFormState> emit,
      Future<Either<AuthFailure, Unit>> Function(
              {required EmailAddress emailAddress, required Password password})
          forwardedCall) async {
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    Either<AuthFailure, Unit>? failureOrSuccess;
    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
          isSubmitting: true, authFailureOrSuccessOption: none()));
      failureOrSuccess = await forwardedCall(
          emailAddress: state.emailAddress, password: state.password);
    }
    emit(state.copyWith(
        isSubmitting: false,
        showErrorMesseges: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess)));
  }
}
