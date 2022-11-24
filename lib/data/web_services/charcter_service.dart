import 'package:breaking_project/constats.dart';
import 'package:breaking_project/data/models/http_error.dart';
import 'package:dio/dio.dart';

class CharacterWebServices {
  late Dio dio;
  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: Constants.Kapi,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }
  //Get All Characters
  Future<List<dynamic>?> fetchAllCharacter() async {
    try {
      Response response = await dio.get(Constants.KallCharacters);
      // print(response.data.toString());
      return response.data;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
// getAllCharacter
