import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:individual_frontend/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:individual_frontend/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:individual_frontend/repositories/crypto_coins/crypto_coins.dart';
import 'package:individual_frontend/theme/theme.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key,
  });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  // List<CryptoCoin>? _cryptoCoinList;

  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList(completer: null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Demo"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBloc.add(LoadCryptoList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: state.coinsList.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final coin = state.coinsList[index];
                    return CryptoCoinTile(coin: coin);
                  },
                );
              }
              if (state is CryptoListLoadingFailure) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Something Went Wrong",
                        style: darkTheme.textTheme.labelSmall
                            ?.copyWith(fontSize: 16)),
                    const SizedBox(height: 30),
                    OutlinedButton(
                        onPressed: () {
                          _cryptoListBloc.add(LoadCryptoList(completer: null));
                        },
                        child: const Text("Try again")),
                  ],
                ));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        )

        // (_cryptoCoinList == null)
        //     ? const Center(child: CircularProgressIndicator())
        //     : ListView.separated(
        //         padding: const EdgeInsets.only(top: 16),
        //         itemCount: _cryptoCoinList!.length,
        //         separatorBuilder: (context, index) => const Divider(),
        //         itemBuilder: (context, index) {
        //           final coin = _cryptoCoinList![index];
        //           return CryptoCoinTile(coin: coin);
        //         },
        //       ),
        );
  }
}
