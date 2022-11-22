class Hotel {
  String name;
  String url;
  Hotel(this.name, this.url);

  // named constructor
  Hotel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['link'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'link': url,
    };
  }

}