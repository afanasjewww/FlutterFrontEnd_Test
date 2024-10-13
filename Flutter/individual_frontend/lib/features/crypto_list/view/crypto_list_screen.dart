import 'package:flutter/material.dart';
import 'package:individual_frontend/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:individual_frontend/repositories/crypto_coins/crypto_coins_repoository.dart';
import 'package:individual_frontend/repositories/crypto_coins/models/crypto_coin.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key,
  });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Demo"),
      ),
      body: (_cryptoCoinList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: _cryptoCoinList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final coin = _cryptoCoinList![index];
                return CryptoCoinTile(coin: coin);
              },
            ),
      // floatingActionButton: FloatingActionButton(
      //     child: const Icon(Icons.download),
      //     onPressed: () async {
      //       await _loadCryptoCoins();
      //     }),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinList = await CryptoCoinsRepoository().getCoinsList();
    setState(() {});
  }
}
