import 'package:flutter/material.dart';

class BrandCheckBox extends StatefulWidget {
  final String name;
  final String imagePath;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const BrandCheckBox({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.value,
    required this.onChanged
  }) : super(key: key);

  @override
  _BrandCheckBoxState createState() => _BrandCheckBoxState();
}

class _BrandCheckBoxState extends State<BrandCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: InkWell(
        onTap: () => widget.onChanged(!widget.value),
        child: Row(
          children: <Widget>[
            Checkbox(
              value: widget.value,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: widget.onChanged,
            ),
            const SizedBox(width: 20),
            Image.asset(widget.imagePath),
            const SizedBox(width: 20),
            Text(
              widget.name,
              style: const TextStyle(color: Color.fromRGBO(118, 128, 149, 1)),
            ),
          ],
        ),
      ),
    );
  }
}
