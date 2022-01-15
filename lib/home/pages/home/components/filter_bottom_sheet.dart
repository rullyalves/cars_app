import 'package:desafio_dryve/home/pages/home/components/color_circle.dart';
import 'package:desafio_dryve/home/pages/home/components/color_list.dart';
import 'package:desafio_dryve/home/pages/home/components/filter_sheet_button.dart';
import 'package:desafio_dryve/home/pages/home/components/bottom_sheet_app_bar.dart';
import 'package:desafio_dryve/home/pages/home/components/marks_list.dart';
import 'package:desafio_dryve/home/pages/home/stores/filter_store.dart';
import 'package:desafio_dryve/home/pages/home/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

const kStrongBlueColor = Color(0xff0065ff);

class FilterSheetWidget extends StatefulWidget {
  const FilterSheetWidget({
    Key? key,
  }) : super(key: key);

  @override
  _FilterSheetWidgetState createState() => _FilterSheetWidgetState();
}

class _FilterSheetWidgetState extends State<FilterSheetWidget> {
  late final HomeStore _homeStore;

  @override
  void initState() {
    _homeStore = Provider.of<HomeStore>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
