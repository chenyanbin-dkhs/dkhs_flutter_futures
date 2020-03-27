import 'package:flutter/material.dart';
import '../routers/app_navigator.dart';
import './pages/instrument_info_page.dart';
import './models/instrument.dart';

class FuturesRouter {
  static instrumentInfo(BuildContext context, Instrument instrument) {
    AppNavigator.push(context, InstrumentInfo(instrument));
  }
}
