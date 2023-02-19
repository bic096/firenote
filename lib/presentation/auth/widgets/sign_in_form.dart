import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notefire/application/auth/sign_in_form/sign_in_form_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () => null,
          (either) {
            either.fold(
              (failure) => FlushbarHelper.createError(
                message: failure.map(
                  cancelledByUser: (_) => "cancelled by user",
                  serverError: (_) => 'server error',
                  invalidEmailAndPasswordCombination: (_) =>
                      "invalid email or password",
                  emailAlreadyInUse: (_) => 'email already in use',
                ),
              ).show(context),
              (_) {
                //TODO: navigate
              },
            );
          },
        );
      },
      builder: (context, state) {
        return Form(
            autovalidateMode: state.showErrorMesseges
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                const Text(
                  '✍️',
                  style: TextStyle(
                    fontSize: 130,
                    color: Colors.amber,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      labelText: 'email',
                    ),
                    autocorrect: false,
                    onChanged: (value) => BlocProvider.of<SignInFormBloc>(
                          context,
                        ).add(
                          SignInFormEvent.emailChanged(
                            value,
                          ),
                        ),
                    validator: (_) => BlocProvider.of<SignInFormBloc>(
                          context,
                        ).state.emailAddress.value.fold(
                              (f) => f.maybeMap(
                                invalidEmail: (_) => 'invalid email',
                                orElse: (() => null),
                              ),
                              (r) => null,
                            )),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    labelText: 'password',
                  ),
                  autocorrect: false,
                  obscureText: true,
                  onChanged: (value) => BlocProvider.of<SignInFormBloc>(
                    context,
                  ).add(
                    SignInFormEvent.passwordChanged(value),
                  ),
                  validator: (_) => BlocProvider.of<SignInFormBloc>(
                    context,
                  ).state.password.value.fold(
                        (f) => f.maybeMap(
                          invalidPassword: (_) => "invalid password",
                          orElse: (() => null),
                        ),
                        (r) => null,
                      ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          BlocProvider.of<SignInFormBloc>(
                            context,
                          ).add(
                            const SignInFormEvent
                                .signInWithEmailAndPasswordPressed(),
                          );
                        },
                        child: const Text('SIGN IN'),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          BlocProvider.of<SignInFormBloc>(
                            context,
                          ).add(
                            const SignInFormEvent
                                .registerWithEmailAndPasswordPressed(),
                          );
                        },
                        child: const Text('REGISTER'),
                      ),
                    )
                  ],
                ),
                MaterialButton(
                  color: Colors.lightBlue,
                  onPressed: (() {
                    BlocProvider.of<SignInFormBloc>(
                      context,
                    ).add(
                      const SignInFormEvent.signInWithGooglePressed(),
                    );
                  }),
                  child: const Text(
                    'SIGN IN WITH GOOGLE',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                if (state.isSubmitting) ...[
                  const LinearProgressIndicator(
                    value: null,
                  )
                ]
              ],
            ));
      },
    );
  }
}
