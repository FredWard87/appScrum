class ScrumItem {
  final String name;
  final String description;
  final String image;
  final String example;

  ScrumItem({
    required this.name,
    required this.description,
    required this.image,
    required this.example,
  });

  factory ScrumItem.fromJson(Map<String, dynamic> json) {
    return ScrumItem(
      name: json['name'],
      description: json['description'],
      image: json['image'],
      example: json['example'],
    );
  }
}
