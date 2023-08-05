import 'package:flutter/material.dart';
import 'package:waiter/core/constant/color.dart';

class TextFildCustom extends StatelessWidget {
  final bool? obscure;
  final Function()? onPressed;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  // final Widget? suffix ;
  final Widget? prefix;
  final String? Function(String?) valid;
  final String hinttext;
  final IconData? icon;
  final Color color;
  final TextEditingController mycontroller;
  const TextFildCustom(
      {Key? key,
      required this.hinttext,
      this.icon,
      required this.mycontroller,
      this.prefix,
      required this.valid,
      required this.keyboardType,
      required this.textInputAction,
      this.obscure,
      required this.color,
      this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 57,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextFormField(
        obscureText: obscure == null || obscure == false ? false : true,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: valid,
        controller: mycontroller,
        style: Theme.of(context).textTheme.displaySmall,
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              icon,
              color: color,
            ),
            onPressed: onPressed,
          ),
          suffixIcon: prefix,
          hintText: hinttext,
          hintStyle: Theme.of(context).textTheme.titleSmall,
          contentPadding: const EdgeInsets.only(left: 5, right: 5),
          filled: true,
          fillColor: AppColor.fillcolor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
