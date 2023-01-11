import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../MQTT/MQTTAppState.dart';
import '../MQTT/MQTTManager.dart';
import '../Screen/Screen.dart';
import '../Helper/service_locator.dart';

/*void main() => runApp(MaterialApp(
  home: Home(),
));*/

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MQTTManager>(
      create: (context) => service_locator<MQTTManager>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home ({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late MQTTManager _manager = MQTTManager();

  void ConnectMqtt() {
    Future.delayed(const Duration(microseconds: 100), () => _manager.connect());
    Future.delayed(const Duration(seconds: 4),
            () => _manager.subScribeTo("flutter_test"));
    print(_manager.currentState.getAppConnectionState);
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    Future.delayed(const Duration(microseconds: 300),
            () => _manager.unSubscribeFromCurrentTopic());
    Future.delayed(
        const Duration(microseconds: 600), () => _manager.disconnect());
    super.dispose();
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    ConnectMqtt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _manager = Provider.of<MQTTManager>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
        'SMART DOOR',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          color: Colors.red,
          fontFamily: 'PTSerif',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top:18, left:24, right:24),
          child:
            CardControl(
              manager: _manager,
              state_d1: _manager.currentState.getd1,
              state_d2: _manager.currentState.getd2,
              state_d3: _manager.currentState.getd3,
              state_d4: _manager.currentState.getd4,
            ),
            ),
          ),
  );
  }
}






