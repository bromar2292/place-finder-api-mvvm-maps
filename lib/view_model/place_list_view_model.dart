import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:placefinder/services/web_services.dart';
import 'package:placefinder/view_model/place_veiw_model.dart';

class PlaceListViewModel extends ChangeNotifier {
  List<PlaceViewModel> places = [];
  var mapType = MapType.normal;

  void toggleMapType() {
    this.mapType =
        this.mapType == MapType.normal ? MapType.satellite : MapType.normal;
    notifyListeners();
  }

  Future<void> fetchPlacesByKeywordAndPosition(
      String keyword, double latitude, double longitude) async {
    final results = await WebService()
        .fetchPlacesByKeyWordAndPosition(keyword, latitude, longitude);
    this.places = results.map((place) => PlaceViewModel(place)).toList();
    print(this.places);
    notifyListeners();
  }
}
