import 'package:desafio_dryve/home/models/filter_params.dart';
import 'package:desafio_dryve/home/models/vehicle.dart';
import 'package:desafio_dryve/home/pages/home/components/bottom_sheet_app_bar.dart';
import 'package:desafio_dryve/home/pages/home/components/color_list.dart';

import 'package:desafio_dryve/home/pages/home/components/feedback_widget.dart';
import 'package:desafio_dryve/home/pages/home/components/filter_sheet_button.dart';
import 'package:desafio_dryve/home/pages/home/components/marks_list.dart';
import 'package:desafio_dryve/home/pages/home/components/vehicle_card.dart';
import 'package:desafio_dryve/home/pages/home/stores/color_store.dart';

import 'package:desafio_dryve/home/pages/home/stores/filter_store.dart';
import 'package:desafio_dryve/home/pages/home/stores/home_store.dart';
import 'package:desafio_dryve/home/pages/home/stores/mark_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'components/filter_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore _homeStore;
  late final ReactionDisposer _reactionDisposer;

  @override
  void initState() {
    _homeStore = Provider.of<HomeStore>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    _reactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const TitleWidget(title: "VW Seminovos"),
        actions: const [FilterWidget()],
      ),
      backgroundColor: Colors.white,
      body: Observer(
        builder: (context) {
          final vehicles = _homeStore.vehicles;
          final items = vehicles.value;
          if (vehicles.hasError) {
            return Center(
              child: FeedbackWidget(
                title: "Ocorreu um erro buscar os dados dos nossos veículos. Por favor, verifique sua conexão com a internet.",
              ),
            );
          } else if (_homeStore.isDisconnected && items == null) {
            return const Center(
              child: FeedbackWidget(
                title: "Não foi possível buscar os dados dos nossos veículos. Por favor, verique sua conexão com a internet.",
              ),
            );
          } else if (items == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (_homeStore.filters.isNotEmpty && items.isEmpty) {
            return Center(
              child: FeedbackWidget(
                buttonTitle: "Limpar Filtros",
                title: "Não encontramos nenhum veículo com essas características.",
                onTap: () {
                  Provider.of<MarkStore>(context, listen: false).clear();
                  Provider.of<ColorStore>(context, listen: false).clear();
                  _homeStore.clearFilters();
                },
              ),
            );
          }
          return GridView.builder(
            itemCount: items.length,
            padding:
                const EdgeInsets.only(top: 25, bottom: 15, left: 20, right: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 9 / 13,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              crossAxisCount: 2,
            ),
            itemBuilder: (_, int index) => VehicleCard(model: items[index]),
          );
        },
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/rectangle.png"),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontFamily: "CircularStd",
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xff4b5670),
          ),
        ),
      ],
    );
  }
}

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    final markStore = Provider.of<MarkStore>(context);
    final colorStore = Provider.of<ColorStore>(context);
    return Observer(builder: (_) {
      
      final amountOfFilters = markStore.filterBrands.length + colorStore.filterColors.length;
      return Stack(
        children: [
          IconButton(
            color: Colors.black,
            padding: const EdgeInsets.all(4),
            icon: const Icon(Icons.tune),
            iconSize: 28,
            onPressed: _showFilter,
          ),
          if (amountOfFilters > 0)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 16,
                width: 16,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff0065ff),
                ),
                child: Center(
                  child: Text(
                    "$amountOfFilters",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }

  void _showFilter() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        minChildSize: 0.9,
        initialChildSize: 0.9,
        builder: (context, controller) {
          final homeStore = Provider.of<HomeStore>(context);
          final markStore = Provider.of<MarkStore>(context);
          final colorStore = Provider.of<ColorStore>(context);
          return GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    const BottomSheetAppBar(),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          const MarksList(),
                          const Divider(
                            color: Color(0xffdddddd),
                            thickness: 1,
                          ),
                          const ColorList(),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: FilterSheetButtonWidget(
                              onPressed: () {
                                markStore.clear();
                                colorStore.clear();
                                homeStore.clearFilters();
                                Navigator.pop(context);
                              },
                              label: "Limpar",
                              labelColor: kStrongBlueColor,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: FilterSheetButtonWidget(
                              onPressed: () {
                                homeStore.filter();
                                Navigator.pop(context);
                              },
                              label: "Aplicar",
                              backgroundColor: kStrongBlueColor,
                              labelColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
