import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskez/Values/values.dart';

class UnlabelledFormInput extends StatelessWidget {
  final String placeholder;
  final String keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  const UnlabelledFormInput({
    Key? key,
    required this.placeholder,
    required this.keyboardType,
    this.controller,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      onTap: () {},
      keyboardType:
          keyboardType == "text" ? TextInputType.text : TextInputType.number,
      //initialValue: initialValue,
      obscureText:
          placeholder == 'Password' || placeholder == 'Choose a password'
              ? true
              : false,

      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 20,
          ),
          suffixIcon: placeholder == "Password"
              ? InkWell(
                  onTap: () {},
                  child: Icon(
                    obscureText
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash,
                    size: 15.0,
                    color: HexColor.fromHex("3C3E49"),
                  ))
              : InkWell(
                  onTap: () {
                    controller!.text = "";
                  },
                  child: Icon(FontAwesomeIcons.solidTimesCircle,
                      color: HexColor.fromHex("3C3E49")),
                ),
          hintText: placeholder,
          hintStyle: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: HexColor.fromHex("3C3E49")),
          filled: false,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: HexColor.fromHex("3C3E49")),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: HexColor.fromHex("BEF0B2")),
          ),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green))),
    );
  }
}
