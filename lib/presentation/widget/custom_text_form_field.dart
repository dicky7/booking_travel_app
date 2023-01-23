import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final String errorText;
  const CustomTextFormField({Key? key, required this.title, required this.hintText, this.obscureText = false, required this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 2),
          TextFormField(
            cursorColor: kBlackColor,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(10)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: kPrimaryColor
                  )
              ),
            ),
            validator: (value) {
              if (value==null || value.isEmpty) {
                return errorText;
              }
            },
          )
        ],

      ),
    );
  }
}
