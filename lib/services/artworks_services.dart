import '../models/artwork.dart';

Future<List<Artwork>> getArtworks(widget, title) async {
  List<Artwork> parsedArtworks = [];
  try {
    var response = await widget.dio.get(
      "https://openaccess-api.clevelandart.org/api/artworks",
      queryParameters: {"limit": 20, "title": title},
    );

    response.data["data"].forEach((artwork) {
      parsedArtworks.add(Artwork(
          id: artwork["id"],
          title: artwork["title"],
          technique: artwork["technique"],
          url: artwork["url"]));
    });
  } catch (e) {
    print(e);
  }
  return parsedArtworks;
}
