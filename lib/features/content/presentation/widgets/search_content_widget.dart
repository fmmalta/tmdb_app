import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/detail/domain/entities/movie_detail_interface.dart';

class SearchContentWidget extends StatelessWidget {
  const SearchContentWidget({
    super.key,
    required this.onFieldSubmitted,
    required this.clearSearchContent,
    required this.type,
  });

  final void Function(String?) onFieldSubmitted;
  final void Function() clearSearchContent;
  final ContentType type;

  final _underlineInputBorder = const UnderlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(28)),
    borderSide: BorderSide(),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.search,
      validator: (value) {
        if (value == null || value.isEmpty) {
          if (type == ContentType.movie) {
            return "Nome do filme é obrigatório";
          } else {
            return "Nome da série é obrigatório";
          }
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: const Color(0xFF0B2342),
        filled: true,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: GestureDetector(
          onTap: clearSearchContent,
          child: Icon(
            Icons.close_rounded,
            color: Colors.white,
            size: 20.w,
          ),
        ),
        alignLabelWithHint: true,
        border: _underlineInputBorder,
        enabledBorder: _underlineInputBorder,
        focusedBorder: _underlineInputBorder,
        hintText: type == ContentType.movie
            ? "Insira o nome do filme"
            : "Insira o nome da série",
      ),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
