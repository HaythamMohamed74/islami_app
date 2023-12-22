class Surah {
  final int id;
  final String name;
  final int aya;
  final String english;
  final String place;
  final String arabic;

  Surah({
    required this.id,
    required this.name,
    required this.aya,
    required this.english,
    required this.place,
    required this.arabic,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      id: json['id'] as int,
      name: json['name'] as String,
      aya: json['aya'] as int,
      english: json['english'] as String,
      place: json['place'] as String,
      arabic: json['arabic'] as String,
    );
  }
}
