import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_dryve/home/models/vehicle.dart';
import 'package:desafio_dryve/home/pages/home/stores/favorite_store.dart';
import 'package:flutter/material.dart';
import 'package:desafio_dryve/shared/utils/string_filter_utils.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class VehicleCard extends StatefulWidget {
  final Vehicle model;

  const VehicleCard({Key? key, required this.model}) : super(key: key);

  @override
  _VehicleCardState createState() => _VehicleCardState();
}

class _VehicleCardState extends State<VehicleCard> {
  late final FavoriteStore _favoriteStore;

  @override
  void initState() {
    _favoriteStore = Provider.of<FavoriteStore>(context, listen: false);
    super.initState();
  }

  void _addOrRemoveFromFavorites() {
    final vehicle = widget.model;
    if (!_favoriteStore.contains(vehicle.id)) {
      _favoriteStore.add(vehicle.id);
      _showSnackBar(
        "${vehicle.brandName} ${vehicle.modelName} Adicionado aos favoritos",
        Icons.check_circle,
        const Color.fromRGBO(0, 101, 255, 1),
      );
    } else {
      _favoriteStore.remove(vehicle.id);
      _showSnackBar(
        "${vehicle.brandName} ${vehicle.modelName} Removido dos favoritos",
        Icons.check_circle_outline,
        const Color.fromRGBO(252, 74, 64, 1),
      );
    }
  }

  void _showSnackBar(String text, IconData iconData, Color color) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1500),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        content: Container(
          child: Row(
            children: <Widget>[
              Icon(iconData),
              const SizedBox(width: 20),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: ShaderMask(
                  blendMode: BlendMode.darken,
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.transparent,
                      ],
                    ).createShader(bounds);
                  },
                  child: Image(
                    image: CachedNetworkImageProvider(
                      widget.model.imageUrl,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Observer(builder: (_) {
                  return IconButton(
                    splashColor: Colors.transparent,
                    enableFeedback: false,
                    icon: _favoriteStore.vehicles.contains(widget.model.id)
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border),
                    onPressed: _addOrRemoveFromFavorites,
                    color: Colors.white,
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Flexible(
                child: Text(
                  "${widget.model.brandName} ",
                  style: const TextStyle(
                    fontFamily: "CircularStd",
                    color: Color(0xff4b5670),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  "${widget.model.modelName}",
                  style: const TextStyle(
                    fontFamily: "CircularStd",
                    color: Color(0xff0065ff),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 3),
          Row(
            children: <Widget>[
              Text(
                "${widget.model.modelYear}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "CircularStd",
                  color: Color(0xff768095),
                  fontSize: 14,
                ),
              ),
              Container(
                height: 3,
                width: 3,
                color: const Color(0xffa5abb7),
                margin: const EdgeInsets.symmetric(horizontal: 7),
              ),
              Expanded(
                child: Text(
                  "${widget.model.fuelType}",
                  style: const TextStyle(
                    fontFamily: "CircularStd",
                    color: Color(0xff768095),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "${widget.model.transmissionType}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: "CircularStd",
                    color: Color(0xff768095),
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                height: 3,
                width: 3,
                color: const Color(0xffa5abb7),
                margin: const EdgeInsets.symmetric(horizontal: 6),
              ),
              Expanded(
                child: Text(
                  "${widget.model.mileage}km",
                  style: const TextStyle(
                    fontFamily: "CircularStd",
                    color: Color(0xff768095),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            widget.model.price.formatToCurrentCurrency,
            style: const TextStyle(
              color: Color(0xff1e2c4c),
              fontSize: 16,
              fontFamily: "CircularStd",
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
