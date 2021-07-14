import 'package:placefinder/models/place.dart';

class PlaceViewModel {
  Place? _place;

  PlaceViewModel(Place place) {
    this._place = place;
  }

  String? get placeId {
    return this._place?.placeid;
  }

  String? get photoURL {
    return this._place?.photoUrl;
  }

  String? get name {
    return this._place?.name;
  }

  double? get latitude {
    return this._place?.latitude;
  }

  double? get longitude {
    return this._place?.longitude;
  }
}
