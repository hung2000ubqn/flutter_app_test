
import 'dart:convert';
import 'dart:math';
import '../Remote/Remote.dart';

enum MQTTAppConnectionState {
  connected,
  disconnected,
  connecting,
  connectedSubscribed,
  connectedUnSubscribed
}

class MQTTAppState {
  MQTTAppConnectionState _appConnectionState =
      MQTTAppConnectionState.disconnected;
  String _receivedText = '';
  String _historyText = '';
  int data = 0;
  bool d1 = false;
  bool d2 = false;
  bool d3 = false;
  bool d4 = false;
  ConvertToBool(int data) {
    if ((data & 1) > 0) {
      d1 = true;
    } else {
      d1 = false;
    }
    if ((data & 2) > 0) {
      d2 = true;
    } else {
      d2 = false;
    }
    if ((data & 4) > 0) {
      d3 = true;
    } else {
      d3 = false;
    }
    if ((data & 8) > 0) {
      d4 = true;
    } else {
      d4 = false;
    }
  }

  void setReceivedText(String text) {
    _receivedText = text;
    // _historyText = _historyText + '\n' + _receivedText;
    final json = jsonDecode(text);
    final remote = Remote.fromJson(json);
    data = remote.data;
    ConvertToBool(data);
  }

  void setAppConnectionState(MQTTAppConnectionState state) {
    _appConnectionState = state;
  }

  void clearText() {
    _historyText = "";
    _receivedText = "";
  }

  String get getReceivedText => _receivedText;
  String get getHistoryText => _historyText;
  int get getdata => data;
  bool get getd1 => d1;
  bool get getd2 => d2;
  bool get getd3 => d3;
  bool get getd4 => d4;

  MQTTAppConnectionState get getAppConnectionState => _appConnectionState;
}
