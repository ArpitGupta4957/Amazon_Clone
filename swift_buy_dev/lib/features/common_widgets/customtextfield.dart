import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  customTextField(
      {Key? key,
      required this.editingController,
      required this.fieldTitle,
      // required this.titleText,
      required this.validator, required this.obscureText})
      : super(key: key);
  final String fieldTitle;
  // final String titleText;
  final bool obscureText;
  final TextEditingController editingController;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return
    //   Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 15.0),
    //       child: Text(
    //         titleText,
    //         style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    //       ),
    //     ),
    //
    //   ],
    // )
    TextFormField(
      controller: editingController,
      validator: validator,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: fieldTitle,
        labelStyle: TextStyle(fontFamily: "productSansReg"),
        // hintText: fieldTitle,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: AppGlobalVariables.primaryColor ,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
