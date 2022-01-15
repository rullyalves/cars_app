
import 'package:desafio_dryve/home/interfaces/color_repository.dart';

import '../interfaces/http_client.dart';
import '../models/color.dart';

class RestColorRepository implements ColorRepository {
  RestColorRepository(this.client);

  static const String kColorsPathUrl = "/ac466e17-58a4-432b-8647-7a2e4c4074e2";
  final HttpClient client;

  Future<List<ColorModel>> findAll() async {
    final res = await client.find(kColorsPathUrl);
    final colors = (res as List).map((e) => ColorModel.fromJson(e)).toList();
    return colors;
  }
}
