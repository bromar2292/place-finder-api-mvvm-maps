import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:placefinder/models/place.dart';
import 'package:placefinder/utils/url_helpter.dart';

class WebService {
  Future<List<Place>> fetchPlacesByKeyWordAndPosition(
      String keyword, double latitude, double longitude) async {
    final url =
        UrlHelper.urlForPlaceKeywordAndLocation(keyword, latitude, longitude);
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(
        response.body,
      );
      final Iterable results = jsonResponse['results'];
      // print(results);
      return results.map((place) => Place.fromJson(place)).toList();
    } else {
      throw Exception('unable to perform request');
    }
  }
}
