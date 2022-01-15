import 'package:desafio_dryve/home/pages/home/components/color_circle.dart';
import 'package:desafio_dryve/home/pages/home/stores/color_store.dart';
import 'package:desafio_dryve/home/pages/home/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class ColorList extends StatefulWidget {
  const ColorList({Key? key}) : super(key: key);

  @override
  _ColorListState createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  late final ColorStore _colorStore;
  late ReactionDisposer disposer;

  @override
  void initState() {
    _colorStore = Provider.of<ColorStore>(context, listen: false);
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    disposer = reaction<ObservableSet<int>>((_) => _colorStore.filterColors, (items) {
      homeStore.filterColors = items;
    });
    super.initState();
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: const Text(
              "Cor",
              style: TextStyle(
                color: Color(0xff1e2c4c),
                fontFamily: "CircularStd",
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Observer(
          builder: (_) {
            final colors = _colorStore.colors.value;

            if (colors == null) {
              return Container();
            }

            return GridView.builder(
                itemCount: colors.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  crossAxisCount: 2,
                  childAspectRatio: 12 / 3,
                ),
                itemBuilder: (_, int index) {
                  final color = colors[index];
                  final colorId = color.colorId;
                  return Observer(
                    builder: (_) {
                      final filterColors = _colorStore.filterColors;

                      final isSelected = filterColors.contains(
                        color.colorId,
                      );
                      return ColorCircle(
                        isMarked: isSelected,
                        color: color.color,
                        title: color.name,
                        colorId: color.colorId,
                        onTap: () {
                          if (_colorStore.contains(colorId)) {
                            _colorStore.removeColor(colorId);
                          } else {
                            _colorStore.addColor(colorId);
                          }
                        },
                      );
                    },
                  );
                });
          },
        ),
      ],
    );
  }
}
