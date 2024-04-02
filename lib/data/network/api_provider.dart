import 'dart:convert';
import 'dart:io';
import 'package:block_part1/data/models/countries_model.dart';
import '../response/my_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<MyResponse> fetchCountry() async {
    MyResponse myResponse = MyResponse();

    try {
      http.Response response = await http
          .get(Uri.parse("https://all-countries.free.mockoapp.net/countries"));
      if (response.statusCode == HttpStatus.ok) {
        myResponse.data =
            (jsonDecode(response.body)["data"]["countries"] as List?)
                    ?.map((e) => CountriesModel.fromJson(e))
                    .toList() ??
                [];
      }
    } catch (e) {
      myResponse.errorText = e.toString();
    }

    return myResponse;
  }
}
