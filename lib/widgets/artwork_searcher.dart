import 'package:flutter/material.dart';
import 'package:restaurants_app/models/artwork.dart';
import 'package:restaurants_app/services/artworks_services.dart';
import 'custom_button.dart';
import 'package:dio/dio.dart';

class ArtworkSearcher extends StatefulWidget {
  ArtworkSearcher({Key? key}) : super(key: key);
  final dio = Dio();

  @override
  _ArtworkSearcherState createState() => _ArtworkSearcherState();
}

class _ArtworkSearcherState extends State<ArtworkSearcher> {
  final _formKey = GlobalKey<FormState>();
  List<dynamic> _artworks = [];

  void searchArtworks(String title) async {
    setState(() {
      try {
        getArtworks(widget, title).then((fetchedArtworks) {
          print("Fetched artworks:");
          fetchedArtworks.forEach((artwork) {
            print(artwork.title + "  " + artwork.url);
          });
          _artworks = fetchedArtworks;
        });
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _artworkTitleController = TextEditingController();

    @override
    void dispose() {
      _artworkTitleController.dispose();
      super.dispose();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Form(
            key: _formKey,
            child: Column(
              children: [
                TextField(
                  controller: _artworkTitleController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      labelText: "Filter by artwork title"),
                ),
                CustomButton(
                  label: "Search",
                  icon: const Icon(Icons.search, size: 32),
                  onClick: () {
                    var artworkTitle = _artworkTitleController.text.trim();
                    if (artworkTitle.isNotEmpty) {
                      searchArtworks(artworkTitle);
                    }
                  },
                ),
                /*
                TODO this should at least list the titles of artworks
                _artworks.length == 0
                    ? Text("No data")
                    : Expanded(
                        child: ListView(
                          children: _artworks.map(
                            (Artwork artwork) => Text(artwork.title),
                          ),
                        ),
                      ),*/
              ],
            ))
      ],
    );
  }
}
