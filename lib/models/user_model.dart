class UserModel {
  int id;
  String name;
  String username;
  String email;
  Address address;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      address: Address.fromJson(json["address"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "username": username,
      "email": email,
      "address": address.toJson(),
    };
  }
}

class Address {
  String street;
  String city;
  String state;
  String zipcode;

  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json["street"],
      city: json["city"],
      state: json["state"],
      zipcode: json["zipcode"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "street": street,
      "city": city,
      "state": state,
      "zipcode": zipcode,
    };
  }
}
