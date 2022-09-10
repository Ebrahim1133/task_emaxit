import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({Key? key, required this.searchTextController})
      : super(key: key);
  final TextEditingController searchTextController;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: searchTextController,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        maxLines: 1,
        onChanged: (searchName) {},
        decoration: InputDecoration(
          hintMaxLines: 1,
          contentPadding: const EdgeInsets.all(12.0),
          fillColor: Colors.white,
          focusColor: Colors.red,
          suffixIcon: const Icon(
            Icons.search,
            size: 22,
            color: backgroundColor,
          ),
          hintText: "البحث باستخدام الرقم التعريفى او اليدوى ",
          hintStyle: const TextStyle(
            color: hintColor,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
