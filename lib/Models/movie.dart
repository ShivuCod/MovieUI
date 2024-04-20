class Movie {
  final String name;
  final String desc;
  final String actor;
  final DateTime releaseDate;
  final String coverImg; // New property for movie cover image URL

  Movie({
    required this.name,
    required this.desc,
    required this.actor,
    required this.releaseDate,
    required this.coverImg, // Include coverImg in constructor
  });

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Description': desc,
      'Directors': actor,
      'ReleaseDate': releaseDate.toIso8601String(),
      'CoverImg': coverImg, // Add coverImg to JSON
    };
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      name: json['Name']??'',
      desc: json['Description']??'',
      actor: json['Directors']??'',
      releaseDate: DateTime.parse(json['ReleaseDate']),
      coverImg: json['CoverImg']??"", // Initialize coverImg from JSON
    );
  }
}
