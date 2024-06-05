// ignore_for_file: public_member_api_docs, sort_constructors_first

class Note {
  final int? id;
  final String title;
  final String description;
  final String color;
  final int isFavourite;
  final String dateTime;

  const Note(
      {required this.title,
      required this.description,
      required this.isFavourite,
      required this.dateTime,
      this.id,
      required this.color});

  factory Note.fromJson(json) => Note(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      isFavourite: json["isFavourite"],
      color: json["color"],
      dateTime: json["dateTime"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "color": color,
        "isFavourite": isFavourite,
        "dateTime": dateTime
      };
}
