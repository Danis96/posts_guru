import 'package:flutter/material.dart';

import '../../../theme/color_helper.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({this.searchController, this.hint, this.onSearch});

  final TextEditingController? searchController;
  final String? hint;
  final Function? onSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: ColorHelper.white.color),
        suffixIcon: Icon(Icons.search, color: ColorHelper.white.color),
        border: _borderBlack,
        enabledBorder: _borderBlack,
        focusedBorder: _borderBlack,
        focusedErrorBorder: _borderBlack,
      ),
      onChanged: (String query) {
        if(onSearch != null) {
          onSearch!();
        }
      },
    );
  }

  OutlineInputBorder get _borderBlack => const OutlineInputBorder(borderSide: BorderSide(color: Colors.black));
}
