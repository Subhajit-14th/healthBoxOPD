import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  TextEditingController? textEditingController = TextEditingController();
  Widget? suffixIcon;
  Widget? prefixIcon;
  List<TextInputFormatter>? inputFormatters;
  TextInputType? textInputType;
  bool passwordVisible = false;
  GlobalKey<FormState>? formKey;
  String validatorType;
  int mlength;
  double? topMargin;
  double? leftMargin;
  double? rightMargin;
  double? bottomMargin;
  String labeltext;
  String retypepassword;
  String hinttext;
  bool readonly;
  bool isEnabled;
  Function()? ontap;
  bool selfValidate;
  Function(String)? onTextChanged;
  String? Function(String?)? Validator;
  Function()? onSaved;
  Color? fillColor;
  Color? hintTextStyleColor;
  Widget? label;
  bool isPassField;
  bool isPassIconChange;
  Iterable<String>? autofillHints;
  int? maxLines;
  final Function(bool isPasswordVisible) onClickButton;

  CommonTextField(
      {Key? key,
      this.textEditingController,
      this.suffixIcon,
      this.inputFormatters,
      this.topMargin,
      this.bottomMargin,
      this.leftMargin,
      this.rightMargin,
      this.textInputType,
      this.prefixIcon,
      this.passwordVisible = false,
      this.isEnabled = true,
      this.formKey,
      this.validatorType = "none",
      this.mlength = 30,
      this.retypepassword = "",
      this.readonly = false,
      this.labeltext = "",
      this.ontap,
      this.selfValidate = false,
      this.Validator,
      this.onTextChanged,
      this.onSaved,
      this.fillColor,
      this.hintTextStyleColor,
      this.label,
      this.autofillHints,
        this.maxLines,
      this.isPassField = false,
        this.isPassIconChange = true,
        required this.onClickButton,
      this.hinttext = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      maxLines: passwordVisible? 1 : maxLines,
      autofillHints: autofillHints,
      readOnly: readonly,
      enabled: isEnabled,
      // maxLines: maxLines,
      onChanged: (val) {
        if (onTextChanged != null) {
          onTextChanged!(val);
        }
      },
      onSaved: (val) => onSaved,
      keyboardType:
          validatorType == "mobile" ? TextInputType.number : textInputType,
      obscureText: !isPassIconChange,
      // maxLength: mLength,
      controller: textEditingController,
      onTap: ontap,
      style: const TextStyle(color: Colors.black),
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.only(left: 10, right: 10, bottom: 14),
        hintText: hinttext,
        fillColor: fillColor ?? Colors.white,
        filled: true,
        suffixIcon: isPassField
            ? IconButton(
          color: Colors.grey,
          splashColor: Colors.transparent,
          onPressed: () {
            onClickButton(isPassIconChange ? false : true);
          },
          icon: Icon(
            isPassIconChange ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          ),
        )
            : suffixIcon,
        prefixIcon: prefixIcon,
        labelText: labeltext,
        alignLabelWithHint: true,
        hintStyle: TextStyle(
          color: hintTextStyleColor ?? Colors.black,
        ),
        //isDense: true,
        labelStyle:
            const TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1.0,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
