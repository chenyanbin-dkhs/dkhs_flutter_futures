import 'package:dkhs_flutter_futures/widgets/chart/line_chart/y_axis.dart';
import 'package:flutter/material.dart';
import '../widgets/chart/line_chart/index.dart';
import '../widgets/chart/line_chart/y_axis.dart';
import '../futures/models/instrument_time_line.dart';
import '../futures/websocket/socket_response.dart';
import '../utils/number_util.dart';
class DotLineDraw extends StatelessWidget {
  const DotLineDraw({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 200),
          painter: MyPainter(context),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  BuildContext context;
  MyPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final painter = new LineChartPainter(context, canvas, size,
        color: Colors.red, paddingLeft: 40);

    dynamic json={"action": "ack_market_time_line", "payload": {"instrument": "IH2005", "time_line": [{"time": "09:30:00", "price": "2777.20", "volume": "656", "open_vol": "58"}, {"time": "09:31:00", "price": "2779.00", "volume": "312", "open_vol": "714"}, {"time": "09:32:00", "price": "2775.00", "volume": "500", "open_vol": "1026"}, {"time": "09:33:00", "price": "2778.80", "volume": "353", "open_vol": "1526"}, {"time": "09:34:00", "price": "2780.80", "volume": "468", "open_vol": "1879"}, {"time": "09:35:00", "price": "2777.00", "volume": "287", "open_vol": "2347"}, {"time": "09:36:00", "price": "2776.40", "volume": "202", "open_vol": "2634"}, {"time": "09:37:00", "price": "2775.40", "volume": "226", "open_vol": "2836"}, {"time": "09:38:00", "price": "2776.00", "volume": "177", "open_vol": "3062"}, {"time": "09:39:00", "price": "2775.80", "volume": "277", "open_vol": "3239"}, {"time": "09:40:00", "price": "2771.80", "volume": "284", "open_vol": "3516"}, {"time": "09:41:00", "price": "2769.20", "volume": "316", "open_vol": "3800"}, {"time": "09:42:00", "price": "2771.00", "volume": "199", "open_vol": "4116"}, {"time": "09:43:00", "price": "2767.40", "volume": "259", "open_vol": "4315"}, {"time": "09:44:00", "price": "2767.60", "volume": "200", "open_vol": "4574"}, {"time": "09:45:00", "price": "2767.40", "volume": "274", "open_vol": "4774"}, {"time": "09:46:00", "price": "2768.60", "volume": "133", "open_vol": "5048"}, {"time": "09:47:00", "price": "2767.60", "volume": "195", "open_vol": "5181"}, {"time": "09:48:00", "price": "2768.60", "volume": "163", "open_vol": "5376"}, {"time": "09:49:00", "price": "2769.80", "volume": "101", "open_vol": "5539"}, {"time": "09:50:00", "price": "2768.40", "volume": "98", "open_vol": "5640"}, {"time": "09:51:00", "price": "2766.40", "volume": "141", "open_vol": "5738"}, {"time": "09:52:00", "price": "2765.80", "volume": "98", "open_vol": "5879"}, {"time": "09:53:00", "price": "2767.80", "volume": "123", "open_vol": "5977"}, {"time": "09:54:00", "price": "2769.00", "volume": "120", "open_vol": "6100"}, {"time": "09:55:00", "price": "2769.60", "volume": "125", "open_vol": "6220"}, {"time": "09:56:00", "price": "2769.00", "volume": "49", "open_vol": "6345"}, {"time": "09:57:00", "price": "2768.20", "volume": "118", "open_vol": "6394"}, {"time": "09:58:00", "price": "2768.60", "volume": "50", "open_vol": "6512"}, {"time": "09:59:00", "price": "2769.80", "volume": "135", "open_vol": "6562"}, {"time": "10:00:00", "price": "2768.40", "volume": "164", "open_vol": "6697"}, {"time": "10:01:00", "price": "2768.00", "volume": "160", "open_vol": "6861"}, {"time": "10:02:00", "price": "2769.80", "volume": "147", "open_vol": "7021"}, {"time": "10:03:00", "price": "2771.40", "volume": "269", "open_vol": "7168"}, {"time": "10:04:00", "price": "2771.40", "volume": "128", "open_vol": "7437"}, {"time": "10:05:00", "price": "2773.80", "volume": "157", "open_vol": "7565"}, {"time": "10:06:00", "price": "2773.00", "volume": "98", "open_vol": "7722"}, {"time": "10:07:00", "price": "2774.40", "volume": "65", "open_vol": "7820"}, {"time": "10:08:00", "price": "2774.60", "volume": "111", "open_vol": "7885"}, {"time": "10:09:00", "price": "2773.80", "volume": "89", "open_vol": "7996"}, {"time": "10:10:00", "price": "2773.40", "volume": "57", "open_vol": "8085"}, {"time": "10:11:00", "price": "2773.20", "volume": "69", "open_vol": "8142"}, {"time": "10:12:00", "price": "2776.00", "volume": "69", "open_vol": "8211"}, {"time": "10:13:00", "price": "2775.60", "volume": "103", "open_vol": "8280"}, {"time": "10:14:00", "price": "2775.80", "volume": "84", "open_vol": "8383"}, {"time": "10:15:00", "price": "2774.60", "volume": "50", "open_vol": "8467"}, {"time": "10:16:00", "price": "2774.40", "volume": "52", "open_vol": "8517"}, {"time": "10:17:00", "price": "2777.80", "volume": "77", "open_vol": "8569"}, {"time": "10:18:00", "price": "2776.20", "volume": "68", "open_vol": "8646"}, {"time": "10:19:00", "price": "2777.20", "volume": "61", "open_vol": "8714"}, {"time": "10:20:00", "price": "2775.40", "volume": "120", "open_vol": "8775"}, {"time": "10:21:00", "price": "2776.80", "volume": "82", "open_vol": "8895"}, {"time": "10:22:00", "price": "2776.60", "volume": "55", "open_vol": "8977"}, {"time": "10:23:00", "price": "2775.00", "volume": "74", "open_vol": "9032"}, {"time": "10:24:00", "price": "2775.40", "volume": "74", "open_vol": "9106"}, {"time": "10:25:00", "price": "2776.40", "volume": "129", "open_vol": "9180"}, {"time": "10:26:00", "price": "2775.80", "volume": "55", "open_vol": "9309"}, {"time": "10:27:00", "price": "2775.60", "volume": "40", "open_vol": "9364"}, {"time": "10:28:00", "price": "2776.40", "volume": "57", "open_vol": "9404"}, {"time": "10:29:00", "price": "2776.80", "volume": "72", "open_vol": "9461"}, {"time": "10:30:00", "price": "2775.00", "volume": "142", "open_vol": "9533"}, {"time": "10:31:00", "price": "2775.40", "volume": "107", "open_vol": "9675"}, {"time": "10:32:00", "price": "2775.20", "volume": "102", "open_vol": "9782"}, {"time": "10:33:00", "price": "2775.60", "volume": "34", "open_vol": "9884"}, {"time": "10:34:00", "price": "2775.20", "volume": "67", "open_vol": "9918"}, {"time": "10:35:00", "price": "2776.00", "volume": "64", "open_vol": "9985"}, {"time": "10:36:00", "price": "2775.60", "volume": "137", "open_vol": "10049"}, {"time": "10:37:00", "price": "2775.40", "volume": "112", "open_vol": "10186"}, {"time": "10:38:00", "price": "2776.40", "volume": "77", "open_vol": "10298"}, {"time": "10:39:00", "price": "2776.40", "volume": "64", "open_vol": "10375"}, {"time": "10:40:00", "price": "2776.80", "volume": "75", "open_vol": "10439"}, {"time": "10:41:00", "price": "2777.20", "volume": "65", "open_vol": "10514"}, {"time": "10:42:00", "price": "2778.40", "volume": "53", "open_vol": "10579"}, {"time": "10:43:00", "price": "2777.80", "volume": "81", "open_vol": "10632"}, {"time": "10:44:00", "price": "2776.80", "volume": "114", "open_vol": "10713"}, {"time": "10:45:00", "price": "2778.40", "volume": "58", "open_vol": "10827"}, {"time": "10:46:00", "price": "2776.80", "volume": "116", "open_vol": "10885"}, {"time": "10:47:00", "price": "2774.20", "volume": "164", "open_vol": "11001"}, {"time": "10:48:00", "price": "2774.40", "volume": "147", "open_vol": "11165"}, {"time": "10:49:00", "price": "2773.60", "volume": "131", "open_vol": "11312"}, {"time": "10:50:00", "price": "2773.20", "volume": "111", "open_vol": "11443"}, {"time": "10:51:00", "price": "2773.80", "volume": "42", "open_vol": "11554"}, {"time": "10:52:00", "price": "2774.00", "volume": "43", "open_vol": "11596"}, {"time": "10:53:00", "price": "2775.40", "volume": "71", "open_vol": "11639"}, {"time": "10:54:00", "price": "2775.00", "volume": "103", "open_vol": "11710"}, {"time": "10:55:00", "price": "2774.40", "volume": "67", "open_vol": "11813"}, {"time": "10:56:00", "price": "2774.40", "volume": "87", "open_vol": "11880"}, {"time": "10:57:00", "price": "2773.80", "volume": "102", "open_vol": "11967"}, {"time": "10:58:00", "price": "2774.60", "volume": "93", "open_vol": "12069"}, {"time": "10:59:00", "price": "2775.20", "volume": "61", "open_vol": "12162"}, {"time": "11:00:00", "price": "2774.00", "volume": "53", "open_vol": "12223"}, {"time": "11:01:00", "price": "2775.20", "volume": "28", "open_vol": "12276"}, {"time": "11:02:00", "price": "2775.60", "volume": "36", "open_vol": "12304"}, {"time": "11:03:00", "price": "2776.60", "volume": "83", "open_vol": "12340"}, {"time": "11:04:00", "price": "2776.00", "volume": "80", "open_vol": "12423"}, {"time": "11:05:00", "price": "2775.60", "volume": "27", "open_vol": "12503"}, {"time": "11:06:00", "price": "2775.60", "volume": "37", "open_vol": "12530"}, {"time": "11:07:00", "price": "2775.00", "volume": "71", "open_vol": "12567"}, {"time": "11:08:00", "price": "2774.20", "volume": "28", "open_vol": "12638"}, {"time": "11:09:00", "price": "2775.60", "volume": "23", "open_vol": "12666"}, {"time": "11:10:00", "price": "2776.40", "volume": "37", "open_vol": "12689"}, {"time": "11:11:00", "price": "2776.40", "volume": "31", "open_vol": "12726"}, {"time": "11:12:00", "price": "2776.20", "volume": "64", "open_vol": "12757"}, {"time": "11:13:00", "price": "2778.40", "volume": "92", "open_vol": "12821"}, {"time": "11:14:00", "price": "2778.00", "volume": "95", "open_vol": "12913"}, {"time": "11:15:00", "price": "2779.00", "volume": "105", "open_vol": "13008"}, {"time": "11:16:00", "price": "2781.00", "volume": "122", "open_vol": "13113"}, {"time": "11:17:00", "price": "2779.60", "volume": "92", "open_vol": "13235"}, {"time": "11:18:00", "price": "2780.60", "volume": "74", "open_vol": "13327"}, {"time": "11:19:00", "price": "2781.60", "volume": "101", "open_vol": "13401"}, {"time": "11:20:00", "price": "2781.60", "volume": "88", "open_vol": "13502"}, {"time": "11:21:00", "price": "2780.40", "volume": "92", "open_vol": "13590"}, {"time": "11:22:00", "price": "2781.00", "volume": "82", "open_vol": "13682"}, {"time": "11:23:00", "price": "2780.20", "volume": "50", "open_vol": "13764"}, {"time": "11:24:00", "price": "2781.00", "volume": "49", "open_vol": "13814"}, {"time": "11:25:00", "price": "2781.00", "volume": "49", "open_vol": "13863"}, {"time": "11:26:00", "price": "2780.40", "volume": "49", "open_vol": "13912"}, {"time": "11:27:00", "price": "2779.40", "volume": "59", "open_vol": "13961"}, {"time": "11:28:00", "price": "2779.00", "volume": "54", "open_vol": "14020"}, {"time": "11:29:00", "price": "2779.00", "volume": "75", "open_vol": "14074"}, {"time": "13:00:00", "price": "2780.80", "volume": "201", "open_vol": "14156"}, {"time": "13:01:00", "price": "2778.20", "volume": "124", "open_vol": "14357"}, {"time": "13:02:00", "price": "2780.80", "volume": "162", "open_vol": "14481"}, {"time": "13:03:00", "price": "2781.00", "volume": "91", "open_vol": "14643"}, {"time": "13:04:00", "price": "2780.60", "volume": "37", "open_vol": "14734"}, {"time": "13:05:00", "price": "2780.40", "volume": "39", "open_vol": "14771"}, {"time": "13:06:00", "price": "2780.80", "volume": "54", "open_vol": "14810"}, {"time": "13:07:00", "price": "2781.20", "volume": "49", "open_vol": "14864"}, {"time": "13:08:00", "price": "2782.00", "volume": "65", "open_vol": "14913"}, {"time": "13:09:00", "price": "2782.40", "volume": "62", "open_vol": "14978"}, {"time": "13:10:00", "price": "2782.60", "volume": "94", "open_vol": "15040"}, {"time": "13:11:00", "price": "2782.40", "volume": "37", "open_vol": "15134"}, {"time": "13:12:00", "price": "2780.40", "volume": "105", "open_vol": "15171"}, {"time": "13:13:00", "price": "2779.60", "volume": "112", "open_vol": "15276"}, {"time": "13:14:00", "price": "2778.60", "volume": "98", "open_vol": "15388"}, {"time": "13:15:00", "price": "2778.40", "volume": "59", "open_vol": "15486"}, {"time": "13:16:00", "price": "2778.00", "volume": "61", "open_vol": "15545"}, {"time": "13:17:00", "price": "2777.40", "volume": "77", "open_vol": "15606"}, {"time": "13:18:00", "price": "2776.80", "volume": "56", "open_vol": "15683"}, {"time": "13:19:00", "price": "2777.60", "volume": "34", "open_vol": "15739"}, {"time": "13:20:00", "price": "2777.80", "volume": "67", "open_vol": "15773"}, {"time": "13:21:00", "price": "2778.60", "volume": "34", "open_vol": "15840"}, {"time": "13:22:00", "price": "2778.40", "volume": "64", "open_vol": "15874"}, {"time": "13:23:00", "price": "2777.80", "volume": "51", "open_vol": "15938"}, {"time": "13:24:00", "price": "2776.80", "volume": "101", "open_vol": "15989"}, {"time": "13:25:00", "price": "2777.00", "volume": "55", "open_vol": "16090"}, {"time": "13:26:00", "price": "2777.20", "volume": "50", "open_vol": "16145"}, {"time": "13:27:00", "price": "2778.60", "volume": "70", "open_vol": "16195"}, {"time": "13:28:00", "price": "2778.40", "volume": "45", "open_vol": "16265"}, {"time": "13:29:00", "price": "2779.60", "volume": "48", "open_vol": "16310"}, {"time": "13:30:00", "price": "2780.80", "volume": "61", "open_vol": "16358"}, {"time": "13:31:00", "price": "2781.20", "volume": "151", "open_vol": "16419"}, {"time": "13:32:00", "price": "2781.40", "volume": "53", "open_vol": "16570"}, {"time": "13:33:00", "price": "2782.00", "volume": "107", "open_vol": "16623"}, {"time": "13:34:00", "price": "2782.00", "volume": "62", "open_vol": "16730"}, {"time": "13:35:00", "price": "2781.40", "volume": "86", "open_vol": "16792"}, {"time": "13:36:00", "price": "2781.60", "volume": "90", "open_vol": "16878"}, {"time": "13:37:00", "price": "2781.20", "volume": "74", "open_vol": "16968"}, {"time": "13:38:00", "price": "2780.00", "volume": "80", "open_vol": "17042"}, {"time": "13:39:00", "price": "2779.60", "volume": "47", "open_vol": "17122"}, {"time": "13:40:00", "price": "2779.20", "volume": "80", "open_vol": "17169"}, {"time": "13:41:00", "price": "2779.80", "volume": "59", "open_vol": "17249"}, {"time": "13:42:00", "price": "2780.20", "volume": "67", "open_vol": "17308"}, {"time": "13:43:00", "price": "2779.40", "volume": "42", "open_vol": "17375"}, {"time": "13:44:00", "price": "2781.00", "volume": "45", "open_vol": "17417"}, {"time": "13:45:00", "price": "2780.20", "volume": "34", "open_vol": "17462"}, {"time": "13:46:00", "price": "2780.00", "volume": "33", "open_vol": "17496"}, {"time": "13:47:00", "price": "2780.20", "volume": "29", "open_vol": "17529"}, {"time": "13:48:00", "price": "2780.60", "volume": "48", "open_vol": "17558"}, {"time": "13:49:00", "price": "2781.00", "volume": "38", "open_vol": "17606"}, {"time": "13:50:00", "price": "2782.00", "volume": "108", "open_vol": "17644"}, {"time": "13:51:00", "price": "2782.00", "volume": "63", "open_vol": "17752"}, {"time": "13:52:00", "price": "2780.80", "volume": "122", "open_vol": "17815"}, {"time": "13:53:00", "price": "2780.00", "volume": "37", "open_vol": "17937"}, {"time": "13:54:00", "price": "2780.80", "volume": "44", "open_vol": "17974"}, {"time": "13:55:00", "price": "2780.40", "volume": "24", "open_vol": "18018"}, {"time": "13:56:00", "price": "2780.60", "volume": "7", "open_vol": "18042"}, {"time": "13:57:00", "price": "2780.60", "volume": "43", "open_vol": "18049"}, {"time": "13:58:00", "price": "2782.00", "volume": "89", "open_vol": "18092"}, {"time": "13:59:00", "price": "2782.40", "volume": "101", "open_vol": "18181"}, {"time": "14:00:00", "price": "2782.80", "volume": "77", "open_vol": "18282"}, {"time": "14:01:00", "price": "2780.60", "volume": "74", "open_vol": "18359"}, {"time": "14:02:00", "price": "2781.40", "volume": "36", "open_vol": "18433"}, {"time": "14:03:00", "price": "2781.40", "volume": "30", "open_vol": "18469"}, {"time": "14:04:00", "price": "2781.80", "volume": "55", "open_vol": "18499"}, {"time": "14:05:00", "price": "2782.00", "volume": "73", "open_vol": "18554"}, {"time": "14:06:00", "price": "2782.40", "volume": "69", "open_vol": "18627"}, {"time": "14:07:00", "price": "2783.60", "volume": "121", "open_vol": "18696"}, {"time": "14:08:00", "price": "2783.40", "volume": "54", "open_vol": "18817"}, {"time": "14:09:00", "price": "2784.60", "volume": "63", "open_vol": "18871"}, {"time": "14:10:00", "price": "2786.00", "volume": "197", "open_vol": "18934"}, {"time": "14:11:00", "price": "2784.40", "volume": "70", "open_vol": "19131"}, {"time": "14:12:00", "price": "2783.80", "volume": "127", "open_vol": "19201"}, {"time": "14:13:00", "price": "2783.20", "volume": "22", "open_vol": "19328"}, {"time": "14:14:00", "price": "2782.60", "volume": "38", "open_vol": "19350"}, {"time": "14:15:00", "price": "2782.20", "volume": "96", "open_vol": "19388"}, {"time": "14:16:00", "price": "2781.80", "volume": "28", "open_vol": "19484"}, {"time": "14:17:00", "price": "2783.60", "volume": "75", "open_vol": "19512"}, {"time": "14:18:00", "price": "2783.20", "volume": "34", "open_vol": "19587"}, {"time": "14:19:00", "price": "2784.20", "volume": "53", "open_vol": "19621"}, {"time": "14:20:00", "price": "2784.20", "volume": "49", "open_vol": "19674"}, {"time": "14:21:00", "price": "2784.60", "volume": "40", "open_vol": "19723"}, {"time": "14:22:00", "price": "2783.20", "volume": "87", "open_vol": "19763"}, {"time": "14:23:00", "price": "2783.80", "volume": "46", "open_vol": "19850"}, {"time": "14:24:00", "price": "2784.20", "volume": "35", "open_vol": "19896"}, {"time": "14:25:00", "price": "2783.00", "volume": "70", "open_vol": "19931"}, {"time": "14:26:00", "price": "2783.00", "volume": "29", "open_vol": "20001"}, {"time": "14:27:00", "price": "2783.60", "volume": "36", "open_vol": "20030"}, {"time": "14:28:00", "price": "2784.20", "volume": "41", "open_vol": "20066"}, {"time": "14:29:00", "price": "2784.40", "volume": "37", "open_vol": "20107"}, {"time": "14:30:00", "price": "2783.40", "volume": "105", "open_vol": "20144"}, {"time": "14:31:00", "price": "2782.80", "volume": "104", "open_vol": "20249"}, {"time": "14:32:00", "price": "2782.80", "volume": "165", "open_vol": "20353"}, {"time": "14:33:00", "price": "2781.00", "volume": "96", "open_vol": "20518"}, {"time": "14:34:00", "price": "2780.40", "volume": "180", "open_vol": "20614"}, {"time": "14:35:00", "price": "2780.80", "volume": "36", "open_vol": "20794"}, {"time": "14:36:00", "price": "2779.40", "volume": "65", "open_vol": "20830"}, {"time": "14:37:00", "price": "2780.60", "volume": "69", "open_vol": "20895"}, {"time": "14:38:00", "price": "2780.80", "volume": "58", "open_vol": "20964"}, {"time": "14:39:00", "price": "2781.00", "volume": "59", "open_vol": "21022"}, {"time": "14:40:00", "price": "2780.20", "volume": "51", "open_vol": "21081"}, {"time": "14:41:00", "price": "2781.00", "volume": "55", "open_vol": "21132"}, {"time": "14:42:00", "price": "2781.60", "volume": "93", "open_vol": "21187"}, {"time": "14:43:00", "price": "2781.80", "volume": "56", "open_vol": "21280"}, {"time": "14:44:00", "price": "2782.00", "volume": "88", "open_vol": "21336"}, {"time": "14:45:00", "price": "2783.20", "volume": "66", "open_vol": "21424"}, {"time": "14:46:00", "price": "2783.40", "volume": "61", "open_vol": "21490"}, {"time": "14:47:00", "price": "2784.40", "volume": "57", "open_vol": "21551"}, {"time": "14:48:00", "price": "2784.00", "volume": "64", "open_vol": "21608"}, {"time": "14:49:00", "price": "2783.40", "volume": "80", "open_vol": "21672"}, {"time": "14:50:00", "price": "2783.60", "volume": "125", "open_vol": "21752"}, {"time": "14:51:00", "price": "2782.20", "volume": "118", "open_vol": "21877"}, {"time": "14:52:00", "price": "2782.40", "volume": "150", "open_vol": "21995"}, {"time": "14:53:00", "price": "2782.00", "volume": "157", "open_vol": "22145"}, {"time": "14:54:00", "price": "2781.80", "volume": "152", "open_vol": "22302"}, {"time": "14:55:00", "price": "2782.60", "volume": "145", "open_vol": "22454"}, {"time": "14:56:00", "price": "2782.20", "volume": "216", "open_vol": "22599"}, {"time": "14:57:00", "price": "2782.00", "volume": "187", "open_vol": "22815"}, {"time": "14:58:00", "price": "2782.80", "volume": "222", "open_vol": "23002"}, {"time": "14:59:00", "price": "2784.60", "volume": "342", "open_vol": "23224"}]}, "aid": "ba39d271-cf28-40ad-ab3b-36e336a734f8"};

     var marketTimeLine =
          InstrumentTimeLine.fromJson(SocketResponse.fromJson(json).payload);
    List<double> prices = marketTimeLine.timeLine.map((item)=>item.percentage(2778)).toList();
        //print(prices);

    final lineData = new LineChartData(prices,
        domainType: DataDomainType.middleZero);

    painter
      ..setChartData(lineData)
      ..drawBackground()
      ..drawLine()
      ..drawYAxisPercentageAndValue(2778);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
