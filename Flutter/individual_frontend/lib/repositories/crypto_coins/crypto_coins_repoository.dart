import 'package:dio/dio.dart';
import 'package:individual_frontend/repositories/crypto_coins/crypto_coins.dart';

class CryptoCoinsRepoository implements AbstractCoinsRepository {
  CryptoCoinsRepoository({required this.dio});
  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,SOL,SUI,USDC,USDT,BNB,XRP,APT,ZRO,NOT,LTC,HMSTR&tsyms=EUR');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinList = dataRaw.entries.map((e) {
      final eurData =
          (e.value as Map<String, dynamic>)['EUR'] as Map<String, dynamic>;
      final price = eurData["PRICE"];
      final imageURL = eurData["IMAGEURL"];
      return CryptoCoin(
        name: e.key,
        priceEUR: price,
        imageURL: 'https://www.cryptocompare.com/$imageURL',
      );
    }).toList();
    return cryptoCoinList;
  }
}
