import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/list/presentation/bloc/favorite_list_bloc.dart';

class CreateFavoriteListIfEmpty extends StatefulWidget {
  const CreateFavoriteListIfEmpty({super.key});

  @override
  State<CreateFavoriteListIfEmpty> createState() =>
      _CreateFavoriteListIfEmptyState();
}

class _CreateFavoriteListIfEmptyState extends State<CreateFavoriteListIfEmpty> {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Nova lista',
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
              label: Text('Nome da lista'),
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
                  context
                      .read<FavoriteListBloc>()
                      .add(CreateListEvent(_titleController.text));
                  Navigator.of(context).pop();
                  context.read<FavoriteListBloc>().add(GetListsEvent());
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
    );
  }
}
