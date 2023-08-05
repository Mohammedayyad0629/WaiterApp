import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class EditTextFild extends StatelessWidget {
  final Widget widget;
  final String text;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final void Function()? onTap;
  final bool enabled;
  final bool? obscure;

  const EditTextFild({
    super.key,
    required this.widget,
    required this.text,
    required this.textInputAction,
    required this.keyboardType,
    required this.mycontroller,
    required this.valid,
    required this.enabled,
    this.onTap,
    this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TextFormField(
        obscureText: obscure == null || obscure == false ? false : true,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: valid,
        style: GoogleFonts.cairo(
          fontSize: 13.0,
          color: Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.w600,
          height: 1.85,
        ),
        controller: mycontroller,
        decoration: InputDecoration(
          enabled: enabled,
          hintText: text,
          errorStyle: TextStyle(fontSize: 14.sp),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Container(margin: EdgeInsets.all(8.0.r), child: widget),
          contentPadding: const EdgeInsets.only(left: 5, right: 5),
          // filled: true,
          // fillColor: AppColor.fillcolor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
