class Artwork {
  final int id;
  final String title;
  final String technique;
  final String url;

  const Artwork(
      {required this.id,
      required this.title,
      required this.technique,
      required this.url});

  factory Artwork.fromMap(Map<String, dynamic> map) {
    return Artwork(
      id: map['id'],
      title: map['title'],
      technique: map['technique'],
      url: map['url'],
    );
  }
}
