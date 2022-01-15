import 'package:desafio_dryve/home/pages/home/stores/filter_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorCircle extends StatelessWidget {
  final Color color;
  final String title;
  final int colorId;
  final bool isMarked;
  final VoidCallback onTap;

  const ColorCircle({
    Key? key,
    required this.color,
    required this.title,
    required this.colorId,
    required this.isMarked,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isMarked
                    ? const Color(0xff0065ff)
                    : const Color(0xffdddddd),
                width: isMarked ? 2.0 : 1.0,
              ),
              color: color,
            ),
            child: isMarked
                ? const Icon(
                    Icons.check,
                    color: Color(0xff0065ff),
                    size: 16,
                  )
                : Container(),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 80,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff768095),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
