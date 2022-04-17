class AddressModel {
  final bool status;
  final List<DetailsAddress> data;

  AddressModel({
    required this.status,
    required this.data,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      status: json['status'] as bool,
      data: (json["data"] as List<dynamic>)
          .map(
            (element) =>
                DetailsAddress.fromJson(element as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

class DetailsAddress {
  final int id;
  final String name;
  final String city;
  final String region;
  final String details;
  final String notes;

  DetailsAddress({
    required this.id,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
  });

  factory DetailsAddress.fromJson(Map<String, dynamic> json) {
    return DetailsAddress(
      id: json['id'] as int,
      name: json['name'] as String,
      city: json['city'] as String,
      region: json['region'] as String,
      details: json['details'] as String,
      notes: json['notes'] as String,
    );
  }
}
