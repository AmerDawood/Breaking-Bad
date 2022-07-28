import 'package:breaking_bad/constants/strings.dart';
import 'package:dio/dio.dart';

class DeathWebServices{

  late Dio dio;


  DeathWebServices(){
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllDeaths()async {
    try {
      Response response = await dio.get('deaths');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

}