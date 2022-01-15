import 'package:desafio_dryve/home/pages/home/components/brand_check_box.dart';
import 'package:desafio_dryve/home/pages/home/stores/home_store.dart';
import 'package:desafio_dryve/home/pages/home/stores/mark_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:desafio_dryve/shared/utils/string_filter_utils.dart';

class MarksList extends StatefulWidget {
  const MarksList({Key? key}) : super(key: key);
  @override
  _MarksListState createState() => _MarksListState();
}

class _MarksListState extends State<MarksList> {
  late final MarkStore _markStore;
  late ReactionDisposer disposer;

  @override
  void initState() {
    _markStore = Provider.of<MarkStore>(context, listen: false);
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    disposer = reaction<ObservableSet<int>>((_) => _markStore.filterBrands, (items) {
      homeStore.filterBrands = items;
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
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 5),
            child: const Text(
              "Marca",
              style: TextStyle(
                color: Color(0xff1e2c4c),
                fontFamily: "CircularStd",
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 25),
          child: TextFormField(
            initialValue: _markStore.searchTerm,
            onChanged: (e) {
              _markStore.searchTerm = e;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.5,
                  style: BorderStyle.solid,
                  color: Color.fromRGBO(118, 128, 149, 1),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.5,
                  style: BorderStyle.solid,
                  color: Color.fromRGBO(118, 128, 149, 1),
                ),
              ),
              hintText: "Buscar por nome...",
              isDense: true,
              hintStyle: const TextStyle(
                color: Color.fromRGBO(118, 128, 149, 1),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 11,
                horizontal: 16,
              ),
              suffixIcon: const Icon(Icons.search, size: 24),
            ),
          ),
        ),
        Observer(
          builder: (_) {
            final brands = _markStore.brands;
        
            if (brands == null) {
              return Container();
            }
            
            return ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: brands.length,
                itemBuilder: (_, int index) {
                  final brand = brands[index];
                  final brandId = brand.brandId;

                  return Observer(builder: (_) {
                    final filterBrands = _markStore.filterBrands;

                    final isSelected = filterBrands.contains(brand.brandId);
                    return BrandCheckBox(
                      name: brand.name.decapitalize(),
                      imagePath: brand.imagePath,
                      value: isSelected,
                      onChanged: (value) {
                        if (_markStore.contains(brandId)) {
                          _markStore.removeBrand(brandId);
                        } else {
                          _markStore.addBrand(brandId);
                        }
                      },
                    );
                  });
                });
          },
        ),
      ],
    );
  }
}
