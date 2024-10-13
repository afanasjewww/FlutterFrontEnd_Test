import 'package:individual_frontend/features/crypto_coin/crypto_coin.dart';
import 'package:individual_frontend/features/crypto_list/crypto_list.dart';

final routes = {
  '/': (context) => const CryptoListScreen(),
  '/coin': (context) => const CryptoCoinScreen()
};
