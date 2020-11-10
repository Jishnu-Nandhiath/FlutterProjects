import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'networking.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  bool isWaiting = false;
  String selectedCurrency = 'USD';
  String btcCurrentworth = '?', ethCurrentworth = '?', ltcCurrentworth = '?';

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(
          currency,
        ),
        value: currency,
      );
      dropDownItems.add(newItem);
    }

    return DropdownButton<String>(
      itemHeight: 500,
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getCurrencyValue();
        });
      },
    );
  }

  CupertinoPicker iosItemBuilder() {
    List<Text> dropdownItem = [];
    for (String currency in currenciesList) {
      dropdownItem.add(Text(
        currency,
        style: TextStyle(color: Colors.white),
      ));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndexPicker) {
        print(selectedIndexPicker);
      },
      children: dropdownItem,
    );
  }

  Future<void> getCurrencyValue() async {
    isWaiting = true;
    GetCoinData currencyWorth = GetCoinData(selectedCurrency);
    dynamic btc = await currencyWorth.getBTCdata();
    dynamic eth = await currencyWorth.getETHdata();
    dynamic ltc = await currencyWorth.getLTCdata();
    setState(() {
      btcCurrentworth = btc.toInt().toString();
      ethCurrentworth = eth.toInt().toString();
      ltcCurrentworth = ltc.toInt().toString();
    });
    isWaiting = false;
  }

  @override
  void initState() {
    getCurrencyValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CoinDataContainer(
            cryptoCoin: 'BTC',
            selectedCurrency: selectedCurrency,
            coinWorth: isWaiting ? '?' : btcCurrentworth,
          ),
          CoinDataContainer(
            cryptoCoin: 'ETH',
            selectedCurrency: selectedCurrency,
            coinWorth: isWaiting ? '?' : ethCurrentworth,
          ),
          CoinDataContainer(
            cryptoCoin: 'LTC',
            selectedCurrency: selectedCurrency,
            coinWorth: isWaiting ? '?' : ltcCurrentworth,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 150.0,
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 30.0),
                color: Colors.lightBlue,
                child: Platform.isIOS ? iosItemBuilder() : androidDropdown(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CoinDataContainer extends StatelessWidget {
  final String cryptoCoin, selectedCurrency, coinWorth;
  CoinDataContainer({this.cryptoCoin, this.selectedCurrency, this.coinWorth});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCoin = $coinWorth $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
