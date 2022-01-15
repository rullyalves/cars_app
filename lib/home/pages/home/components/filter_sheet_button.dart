import 'package:flutter/material.dart';

class FilterSheetButtonWidget extends StatelessWidget {
  const FilterSheetButtonWidget({
    Key? key,
    required this.label,
    required this.labelColor,
    required this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);
  
  final String label;
  final Color labelColor;
  final Color backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Color(0xffd3d5dc),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: FlatButton(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 20,
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: labelColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
