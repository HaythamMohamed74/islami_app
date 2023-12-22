// import 'dart:convert';


class Zekr {
  final String category;
  final String count;
  final String description;
  final String reference;
  final String zekr;

  Zekr({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.zekr,
  });

  factory Zekr.fromJson(Map<String, dynamic> json) {
    return Zekr(
      category: json['category'],
      count: json['count'],
      description: json['description'],
      reference: json['reference'],
      zekr: json['zekr'],
    );
  }

}
