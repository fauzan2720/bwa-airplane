import 'package:airplane/models/destination_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String? id;
  final DestinationModel destination;
  final int amountOfTraveler;
  final String selectedSeats;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;
  final String? createdAt;

  const TransactionModel({
    this.id,
    required this.destination,
    required this.amountOfTraveler,
    required this.selectedSeats,
    this.insurance = false,
    this.refundable = false,
    required this.vat,
    required this.price,
    required this.grandTotal,
    this.createdAt,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) {
    return TransactionModel(
      destination: DestinationModel.fromJson(
          json['destination']['id'], json['destination']),
      id: id,
      amountOfTraveler: json['amountOfTraveler'],
      selectedSeats: json['selectedSeats'],
      insurance: json['insurance'],
      refundable: json['refundable'],
      vat: json['vat'],
      price: json['price'],
      grandTotal: json['grandTotal'],
      createdAt: json['createdAt'],
    );
  }

  @override
  List<Object?> get props => [
        destination,
        amountOfTraveler,
        selectedSeats,
        insurance,
        refundable,
        vat,
        price,
        grandTotal,
        createdAt
      ];
}
