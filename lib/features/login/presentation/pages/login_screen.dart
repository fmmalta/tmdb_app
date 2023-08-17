import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/presentation/pages/home_screen.dart';
import 'package:movie_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:movie_app/features/login/presentation/widgets/email_form.dart';
import 'package:movie_app/features/login/presentation/widgets/password_form.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }
            if (state is LoginFailure) {
              if (state.failure is NoConnectionFailure) {
                controller.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              }
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: SvgPicture.asset('assets/loginScreenIcon.svg'),
                ),
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller,
                      children: [
                        EmailForm(controller),
                        PasswordForm(controller),
                        NoConnectionWidget(controller)
                        // PasswordForm(),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
