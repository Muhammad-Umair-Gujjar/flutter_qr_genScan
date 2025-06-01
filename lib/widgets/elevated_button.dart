import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomElevatedButton extends StatelessWidget {

  final String btnLabel;
  final IconData btnIcon;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color iconColor;
  final Color labelColor;
  final double fontSize;
  final OutlinedBorder? shape;

  const CustomElevatedButton({super.key,
    required this.btnLabel,
    required this.btnIcon,
    required this.onPressed,
    this.bgColor=Colors.black,
    this.iconColor=Colors.white,
    this.labelColor=Colors.white,
    this.fontSize= 18,
    this.shape,
  });


  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        label: Text(btnLabel),
        icon: Icon(btnIcon,color: iconColor,),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: labelColor,
          side: BorderSide(color: bgColor),
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize
          ),
          shape: shape,
        ),
    );
  }
}
