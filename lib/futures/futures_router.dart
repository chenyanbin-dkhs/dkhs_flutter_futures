import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routers/app_navigator.dart';
import './pages/instrument_info_page.dart';
import './models/instrument.dart';

import './websocket/socket_market_snap_provider.dart';

class FuturesRouter {
  static goInstrumentInfo(BuildContext context, Instrument instrument,
      SocketMarketSnapProvider snapProvider) {
    print(snapProvider);
    // AppNavigator.push(context, InstrumentInfo(instrument));
    AppNavigator.push(
        context,
        ChangeNotifierProvider.value(
          value: snapProvider,
          child: InstrumentInfo(instrument),
        ));
  }
}
