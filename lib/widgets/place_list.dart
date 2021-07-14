import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:placefinder/utils/url_helpter.dart';
import 'package:placefinder/view_model/place_veiw_model.dart';

class PlaceList extends StatelessWidget {
  final List<PlaceViewModel>? places;
  // Function(PlaceViewModel) onSelected;

  PlaceList({this.places});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.places?.length,
      itemBuilder: (context, index) {
        final place = this.places?[index];
        return ListTile(
          // onTap: this.onSelected(place!),
          leading: Container(
            height: 100,
            width: 100,
            child: Image.network(
              UrlHelper.urlForReferenceImage(place!.photoURL as String),
              fit: BoxFit.cover,
            ),
          ),
          title: Text(place.name as String),
        );
      },
    );
  }
}
