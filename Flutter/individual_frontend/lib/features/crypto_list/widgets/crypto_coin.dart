import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coinName,
  });

  final String coinName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'assets/img/bitcoin.png',
        height: 30,
        width: 30,
      ),
      title: Text(
        // '$coinName ${_counters[index]}',
        coinName,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(
        "35000\$",
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
          arguments: coinName,
        );
      },
    );
  }
}
