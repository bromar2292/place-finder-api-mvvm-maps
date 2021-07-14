import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:map_launcher/map_launcher.dart' as prefix;
// import 'package:map_launcher/map_launcher.dart';
import 'package:placefinder/view_model/place_list_view_model.dart';
import 'package:placefinder/view_model/place_veiw_model.dart';
import 'package:placefinder/widgets/place_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Set<Marker> _getPlaceMarkers(List<PlaceViewModel> places) {
    return places.map(
      (place) {
        return Marker(
          markerId: MarkerId(place.placeId ?? 'nothing'),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: place.name),
          position: LatLng(place.latitude ?? 15.0001, place.longitude ?? -1.5),
        );
      },
    ).toSet();
  }

  Completer<GoogleMapController> _controller = Completer();
  Position? _currentPosition;

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target:
              LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          zoom: 14,
        ),
      ),
    );
  }
  //
  // Future<void> _openMapsFor(PlaceViewModel vm) async {
  //   if (await MapLauncher.isMapAvailable(prefix.MapType.google) != null) {
  //     await prefix.MapLauncher.showMarker(
  //         mapType: prefix.MapType.google,
  //         coords: Coords(vm.latitude as double, vm.longitude as double),
  //         title: vm.name as String);
  //   } else if (await MapLauncher.isMapAvailable(prefix.MapType.apple) != null) {
  //     await prefix.MapLauncher.showMarker(
  //         mapType: prefix.MapType.apple,
  //         coords: Coords(vm.latitude as double, vm.longitude as double),
  //         title: vm.name as String);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PlaceListViewModel>(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              mapType: vm.mapType,
              markers: _getPlaceMarkers(vm.places),
              myLocationButtonEnabled: true,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(52.950001, -1.150000),
                zoom: 14,
              ),
            ),
            TextField(
              onSubmitted: (value) {
                vm.fetchPlacesByKeywordAndPosition(value,
                    _currentPosition!.latitude, _currentPosition!.longitude);
                print(_currentPosition!.latitude);
              },
              decoration: InputDecoration(
                labelText: 'search here',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            Visibility(
              visible: vm.places.length > 0 ? true : false,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: TextButton(
                    child: Text(
                      'Show List',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => PlaceList(
                          // onSelected: () {
                          //   print('hello');
                          // },
                          places: vm.places,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              top: 150,
              right: 10,
              child: FloatingActionButton(
                onPressed: () {
                  vm.toggleMapType();
                },
                child: Icon(Icons.map),
              ),
            )
          ],
        ),
      ),
    );
  }
}
