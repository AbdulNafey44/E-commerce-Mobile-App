import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.dateTime,
    this.selectedAddress = true,
  });

  static AddressModel empty() => AddressModel(id: '', name: '', phoneNumber: '', street: '', city: '', state: '', postalCode: '', country: '');

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'street': street,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'selectedAddress': selectedAddress,
      'dateTime': dateTime != null ? Timestamp.fromDate(dateTime!) : Timestamp.now(),
    };
  }

  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>? ?? {};
    return AddressModel(
      id: snapshot.id,
      name: data['name'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      street: data['street'] ?? '',
      city: data['city'] ?? '',
      state: data['state'] ?? '',
      postalCode: data['postalCode'] ?? '',
      country: data['country'] ?? '',
      selectedAddress: data['selectedAddress'] ?? false,
      dateTime: data['dateTime'] != null ? (data['dateTime'] as Timestamp).toDate() : DateTime.now(),
    );
  }

  @override
  String toString() {
    return '$street, $city, $state, $postalCode, $country';
  }
}