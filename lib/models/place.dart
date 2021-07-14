class Place {
  final String? name;
  final double? latitude;
  final double? longitude;
  final String? placeid;
  late String? photoUrl = 'images/place-holder';

  Place(
      {this.longitude, this.latitude, this.name, this.photoUrl, this.placeid});

  factory Place.fromJson(Map<String, dynamic> json) {
    final location = json['geometry']['location'];
    Iterable photos = json['photos'];

    return Place(
      placeid: json["place_id"],
      name: json["name"],
      latitude: location["lat"],
      longitude: location["lng"],
      photoUrl: photos.first["photo_reference"].toString(),
    );
  }
}

// #import "AppDelegate.h"
// #import "FlutterPluginRegistrant/GeneratedPluginRegistrant.h"
// #import "GoogleMaps/GoogleMaps.h"
// @implementation AppDelegate
//
// - (BOOL)application:(UIApplication *)application
// didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
// [GMSServices provideAPIKey:@"AIzaSyBe80TOa0sOeoEY5DpM-11v-x_qZhf-3zA"];
// [GeneratedPluginRegistrant registerWithRegistry:self];
// return [super application:application didFinishLaunchingWithOptions:launchOptions];
// }
//
// @end

// <key>NSLocationWhenInUseUsageDescription</key>
// <string>This app needs access to location when open.</string>
// <key>NSLocationAlwaysUsageDescription</key>
// <string>This app needs access to location when in the background.</string>
