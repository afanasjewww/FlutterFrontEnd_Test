import 'package:flutter/material.dart';
import 'package:individual_frontend/repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(coin.imageURL),
      title: Text(
        // '$coinName ${_counters[index]}',
        coin.name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(
        "${coin.priceEUR} \$",
        style: Theme.of(context).textTheme.labelSmall,
      ),
      trailing: IconButton(
        onPressed: () => {},
        icon: const Icon(Icons.arrow_forward_ios),
      ),
      // trailing: IconButton(
      //   icon: const Icon(Icons.arrow_forward_ios),
      //   onPressed: () =>
      //       _incrementCounter(index), // Call the function to increment counter
      // ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coin,
        );
      },
    );
  }
}
