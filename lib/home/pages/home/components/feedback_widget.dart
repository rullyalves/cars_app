import 'package:flutter/material.dart';

class FeedbackWidget extends StatelessWidget {
  final String title;
  final String? buttonTitle;
  final VoidCallback? onTap;

  const FeedbackWidget({
    Key? key,
    required this.title,
    this.buttonTitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Ops!",
          style: TextStyle(
              fontFamily: "CircularStd",
              fontSize: 21,
              color: Color.fromRGBO(0, 0, 0, 1),
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: "CircularStd",
              color: Color.fromRGBO(118, 128, 149, 1),
              fontSize: 17,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        if (buttonTitle != null)
          FlatButton(
            onPressed: onTap,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              buttonTitle!,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: "CircularStd",
                color: Color.fromRGBO(0, 101, 255, 1),
                fontSize: 15,
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                side: BorderSide(
                  width: 0.4,
                  color: Color.fromRGBO(118, 128, 149, 1),
                )),
          )
      ],
    );
  }
}
