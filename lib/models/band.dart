class Band {
  Band({
    required this.id,
    required this.name,
    required this.votes,
  });

  String id;
  String name;
  int votes;

  factory Band.fromJson(Map<String, dynamic> json) {
    return Band(
      id: json["id"],
      name: json["name"],
      votes: json["votes"],
    );
  }
}
