import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notefire/domain/auth/i_auth_facade.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;
  AuthBloc(this._authFacade) : super(const Initial()) {
    on<AuthEvent>(
      (event, emit) async {
        await event.map(
          authCheckRequested: ((_) {
            final userOption = _authFacade.getSignInUser();
            emit(
              userOption.fold(
                () => const AuthState.unAuthenticated(),
                (t) => const AuthState.authenticated(),
              ),
            );
          }),
          signedOut: (_) async {
            await _authFacade.signOut();
            emit(
              const AuthState.unAuthenticated(),
            );
          },
        );
      },
    );
  }
}
