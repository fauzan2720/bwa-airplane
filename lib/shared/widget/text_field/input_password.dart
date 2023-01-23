import 'package:flutter/material.dart';
import '/shared/util/style/border_radius.dart';
import '/shared/util/style/color.dart';
import '../../../state_util.dart';

class FozInputPassword extends StatefulWidget {
  const FozInputPassword({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.strokeColorInput,
    this.backgroundInput,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String? hintText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Color? strokeColorInput;
  final Color? backgroundInput;
  final String label;
  final String value;
  final void Function(String) onChanged;

  @override
  State<FozInputPassword> createState() => _FozInputPasswordState();
}

class _FozInputPasswordState extends State<FozInputPassword> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(color: darkColor),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: SizedBox(
            width: Get.width,
            child: TextFormField(
              style: TextStyle(color: darkColor),
              initialValue: widget.value,
              keyboardType: widget.keyboardType,
              obscureText: showPassword,
              decoration: InputDecoration(
                fillColor: whiteColor,
                contentPadding: widget.prefixIcon != null
                    ? const EdgeInsets.only(top: 14.0)
                    : const EdgeInsets.all(18.0),
                filled: true,
                hintText: widget.hintText,
                prefixIcon: widget.prefixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: widget.prefixIcon,
                      )
                    : null,
                suffixIcon: InkWell(
                  onTap: () {
                    showPassword = !showPassword;
                    setState(() {});
                  },
                  child: Icon(
                    showPassword
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined,
                    color: strokeColor,
                    size: 22,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radiusPrimarySize),
                  borderSide: BorderSide(color: primaryColor, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radiusPrimarySize),
                  borderSide: BorderSide(color: strokeColor, width: 1.0),
                ),
                hoverColor: secondaryColor,
                hintStyle: TextStyle(color: strokeColor),
              ),
              onChanged: widget.onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
