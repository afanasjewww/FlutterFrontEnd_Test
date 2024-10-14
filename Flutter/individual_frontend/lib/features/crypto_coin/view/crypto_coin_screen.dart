import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  //String? coinName;

  // @override
  // void didChangeDependencies() {
  //   //final args = ModalRoute.of(context)?.settings.arguments;

  //   // if (args == null) {
  //   //   print("You have to provide args");
  //   //   return;
  //   // }
  //   // if (args is! String) {
  //   //   print('You have to provide string format');
  //   //   return;
  //   // }

  //   //assert(args != null && args is String, "You have to provide string format");

  //   coinName = args as String;
  //   setState(() {});
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 220,
              width: 120,
              child: Image.asset(
                'assets/img/bitcoin.png',
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25),
            ),
            const Text(
              "Bitcoin",
              style: TextStyle(
                  color: Color.fromARGB(255, 114, 111, 110),
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Container(
              height: 100,
              width: 300,
              decoration: const BoxDecoration(
                color: Color.fromARGB(115, 97, 97, 97),
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
              child: const Center(
                child: Text(
                  "Outlined Box",
                  style: TextStyle(color: Colors.yellow, fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
