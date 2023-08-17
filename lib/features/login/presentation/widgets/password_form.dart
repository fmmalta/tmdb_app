import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:movie_app/features/login/presentation/bloc/login_event.dart';

class PasswordForm extends StatefulWidget {
  final PageController controller;
  const PasswordForm(this.controller, {super.key});

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(left: 36.w, right: 36.w, bottom: 36.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quase lá!',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 45.sp, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 16.h),
            Text(
              'Agora digite sua senha',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 24.sp),
            ),
            SizedBox(height: 16.h),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return TextFormField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira sua senha';
                    } else if (value.length < 6) {
                      return 'A senha deve conter no mínimo 6 caracteres';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context.read<LoginBloc>().password =
                          passwordController.text;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    errorText:
                        state is LoginFailure ? state.failure.message() : null,
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      child: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16.h),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return AnimatedCrossFade(
                  crossFadeState: state is LoginLoading
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 150),
                  firstChild: Center(
                      child: SizedBox(
                          height: 40.h,
                          child: const CircularProgressIndicator.adaptive())),
                  secondChild: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40.h),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<LoginBloc>().password =
                            passwordController.text;
                        context.read<LoginBloc>().add(LoginButtonPressed());
                      }
                    },
                    icon: const Icon(Icons.arrow_forward, color: Colors.black),
                    label: const Text("Entrar"),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class NoConnectionWidget extends StatelessWidget {
  final PageController controller;
  const NoConnectionWidget(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 36.w, right: 36.w, bottom: 36.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Oops!',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 45.sp, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 16.h),
          Text(
            'Verifique sua conexão',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: 24.sp),
          ),
          SizedBox(height: 16.h),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40.h),
            ),
            onPressed: () {
              controller.previousPage(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
              );
            },
            icon: const Icon(Icons.arrow_forward, color: Colors.black),
            label: const Text("Tentar novamente"),
          )
        ],
      ),
    );
  }
}
