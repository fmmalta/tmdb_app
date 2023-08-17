import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/login/presentation/bloc/login_bloc.dart';

class EmailForm extends StatefulWidget {
  final PageController controller;
  const EmailForm(this.controller, {super.key});

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();

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
              'Bem vindo',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 45.sp, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 16.h),
            Text(
              'Acesse sua conta TMDB',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 24.sp),
            ),
            SizedBox(height: 16.h),
            TextFormField(
              controller: userNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Insira seu email';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              onChanged: (value) {},
              onFieldSubmitted: (value) {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<LoginBloc>().email = userNameController.text;
                  widget.controller.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              decoration: const InputDecoration(
                labelText: 'Usuário',
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<LoginBloc>().email = userNameController.text;
                    widget.controller.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                icon: const Icon(Icons.arrow_forward, color: Colors.black),
                label: const Text("Avançar")),
          ],
        ),
      ),
    );
  }
}
