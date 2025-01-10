class Event {
  final String miniPicture;
  final List<String> pictures;
  final String title;
  final String description;
  final String location;
  final DateTime date;
  final double price;

  Event({
    required this.miniPicture,
    required this.pictures,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    required this.price,
  });

  // jsonda event nesnesi oluşturmak için cons.
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      miniPicture: json['miniPicture'],
      pictures: List<String>.from(json['pictures']),
      title: json['title'],
      description: json['description'],
      location: json['location'],
      date: DateTime.parse(json['date']),
      price: json['price'].toDouble(),
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'miniPicture': miniPicture,
      'pictures': pictures,
      'title': title,
      'description': description,
      'location': location,
      'date': date.toIso8601String(),
      'price': price,
    };
  }

  // eventi databasee eklemek için format değişikliği
  Map<String, dynamic> toMap() {
    return {
      'miniPicture': miniPicture,
      'pictures': pictures.join(','),
      'title': title,
      'description': description,
      'location': location,
      'date': date.toIso8601String(),
      'price': price,
    };
  }

  // event oluşturmak için sql uyumu
  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      miniPicture: map['miniPicture'],
      pictures: map['pictures'].split(','),
      title: map['title'],
      description: map['description'],
      location: map['location'],
      date: DateTime.parse(map['date']),
      price: map['price'],
    );
  }
}
