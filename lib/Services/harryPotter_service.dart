import 'package:dio/dio.dart';
import 'package:rwad2/models/harryPotterModel.dart';

class HarryPotterService {
  final dio = Dio();

  Future<List<HarryPotterModel>> getHarryBooks() async {
    List<HarryPotterModel> harry = [];

    try {
      final Response = await dio.get(
        'https://potterapi-fedeperin.vercel.app/en/books',
      );
      print('statusCode: ${Response.statusCode}');
      List<dynamic> data = Response.data;
      harry = data.map((book)=>HarryPotterModel.fromJson(book)).toList();
    } catch (e) {
      print(e.toString());
    }

    return harry;
  }
}
