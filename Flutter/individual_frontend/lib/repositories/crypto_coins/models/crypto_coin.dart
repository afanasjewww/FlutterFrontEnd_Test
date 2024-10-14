import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin(
      {required this.name, required this.priceEUR, required this.imageURL});

  final String name;
  final double priceEUR;
  final String imageURL;

  @override
  List<Object> get props => [name, priceEUR, imageURL];
}
