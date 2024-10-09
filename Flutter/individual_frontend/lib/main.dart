import 'package:flutter/material.dart';

void main() {
  runApp(const FrontendApp());
}

class FrontendApp extends StatelessWidget {
  const FrontendApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        dividerColor: Colors.white24,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.yellow,
            titleTextStyle: TextStyle(
                color: Colors.black87,
                fontSize: 30,
                fontWeight: FontWeight.w700),
            centerTitle: true),
        listTileTheme: const ListTileThemeData(iconColor: Colors.yellow),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          labelSmall: TextStyle(
            color: Colors.grey,
          ),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<int> _counters = List.generate(20, (index) => 0);

  void _incrementCounter(int index) {
    setState(() {
      _counters[index]++; // Increment the counter for the specific row
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Demo"),
      ),
      body: ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => ListTile(
          leading: Image.asset(
            'assets/img/bitcoin.png',
            height: 30,
            width: 30,
          ),
          title: Text(
            'Bitcoin ${_counters[index]}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            "35000\$",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _incrementCounter(
                index), // Call the function to increment counter
          ),
        ),
      ),
    );
  }
}
