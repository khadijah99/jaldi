import 'package:flutter/material.dart';

class InkWellText extends StatefulWidget {
  final String text;
  const InkWellText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<InkWellText> createState() => _InkWellTextState();
}

class _InkWellTextState extends State<InkWellText> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          isHovered = value;
        });
      },
      onTap: () {},
      child: Text(
        widget.text,
        style: TextStyle(
            decoration:
                isHovered ? TextDecoration.underline : TextDecoration.none,
            decorationColor: isHovered ? Colors.yellow : Colors.transparent,
            decorationThickness: 2.0,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF244494)),
      ),
    );
  }
}
