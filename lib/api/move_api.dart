import 'package:dio/dio.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_move_detail.dart';

class MoveApi {
  Dio dio = Dio();

  Future<MoveDetail> getMoveDetail(Move move) async {
    String url = move.move!.url!;

    try {
      final response = await dio.request(url);
      final data = response.data;
      if (data == null) throw 'Move not found: {$move}';

      final detail = MoveDetail.fromJson(data);

      return detail;
    } catch (e) {
      throw 'Error getting poké move: ${e.toString()}';
    }
  }
}
