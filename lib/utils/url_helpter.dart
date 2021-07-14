class UrlHelper {
  static String urlForReferenceImage(String photoReferenceId) {
    return 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReferenceId&key=AIzaSyBe80TOa0sOeoEY5DpM-11v-x_qZhf-3zA';
  }

  static String urlForPlaceKeywordAndLocation(
      String keyword, double latitude, double longitude) {
    return 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=1500&type=restaurant&keyword=$keyword&key=AIzaSyBe80TOa0sOeoEY5DpM-11v-x_qZhf-3zA';
  }
}
// return 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=1500&type=restaurant&keyword=cruise&key=AIzaSyBe80TOa0sOeoEY5DpM-11v-x_qZhf-3zA';
