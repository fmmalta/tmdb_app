import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/list/presentation/bloc/favorite_list_bloc.dart';

class EditListName extends StatefulWidget {
  final String listID;
  const EditListName(this.listID, {super.key});

  @override
  State<EditListName> createState() => _EditListNameState();
}

class _EditListNameState extends State<EditListName> {
  final TextEditingController _titleController = TextEditingController();

  late GlobalKey<FormState> _key;

  @override
  void initState() {
    _key = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
          bottom: MediaQuery.of(context).viewInsets.bottom + 25.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Editar nome lista',
              style: TextStyle(fontSize: 22.sp, color: Colors.white),
            ),
            SizedBox(height: 30.h),
            TextFormField(
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Preencha o nome da lista';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.name,
              controller: _titleController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                label: Text('Insira o nome aqui'),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    _key.currentState!.save();
                    context.read<FavoriteListBloc>().add(
                          EditListNameEvent(
                            id: widget.listID,
                            newTitle: _titleController.text,
                          ),
                        );
                    Navigator.of(context).pop(true);
                  }
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  foregroundColor: const Color(0xFF36B0E5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28)),
                ),
                child: const Text('+ Salvar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
