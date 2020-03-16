import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../websocket/socket_market_snap_provider.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  GlobalKey _scaffold = GlobalKey();

  @override
  void initState() {
    super.initState();

    // new Future.delayed(Duration.zero, () {

    // });

    WidgetsBinding.instance.addPostFrameCallback((callback) {
      Provider.of<SocketMarketSnapProvider>(_scaffold.currentContext,
              listen: false)
          .requestQuotes(['IF2003', 'IF1909']);
    });
  }

  @override
  void dispose() {
    SocketMarketSnapProvider().closeWebSocket();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SocketMarketSnapProvider(),
      child: Scaffold(
        key: _scaffold,
        appBar: AppBar(
          title: Text('我的'),
        ),
        body: Center(
          child: Column(children: [
            RaisedButton(onPressed: () => {}),
            Consumer<SocketMarketSnapProvider>(
              builder: (context, value, child) {
                var quote = value.quoteByCode('IF2003');
                return Text(quote?.id ?? '');
              },
            ),
            Consumer<SocketMarketSnapProvider>(
              builder: (context, value, child) {
                var quote = value.quoteByCode('IF1909');
                return Text(quote?.id ?? '');
              },
            ),
          ]),
        ),
      ),
    );
  }
}
