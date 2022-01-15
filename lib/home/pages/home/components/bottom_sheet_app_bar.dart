import 'package:flutter/material.dart';

class BottomSheetAppBar extends StatelessWidget {
  const BottomSheetAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Image.asset("assets/chevron_down.png"),
            onPressed: Navigator.of(context).pop,
          ),
          const Text(
            "Filtrar",
            style: TextStyle(
              color: Color(0xff1e2c4c),
              fontFamily: "CircularStd",
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }
}
