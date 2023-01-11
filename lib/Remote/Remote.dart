class Remote {
  int data;

  Remote({required this.data});

  factory Remote.fromJson(Map<String, dynamic> parsedJson) {
    //print(streetsFromJson.runtimeType);
    // List<String> streetsList = new List<String>.from(streetsFromJson);
    int data = parsedJson['data'];

    return Remote(data: data);
  }
}