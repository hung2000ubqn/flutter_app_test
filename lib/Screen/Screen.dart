import 'package:flutter/material.dart';
import '../MQTT/MQTTManager.dart';

class CardControl extends StatefulWidget {
  CardControl(
      {Key? key,
      required this.manager,
      required this.state_d1,
      required this.state_d2,
      required this.state_d3,
      required this.state_d4,})
      : super(key: key);
  MQTTManager manager;
  bool state_d1;
  bool state_d2;
  bool state_d3;
  bool state_d4;

  @override
  State<CardControl> createState() => _CardControlState();
}

class _CardControlState extends State<CardControl> {
  // String parse_json_data(int data) {
  //   String jsonData = "";
  //   jsonData = "{\"data\":$data}";
  //   return jsonData;
  // }
  void toggle_d1() {
    setState(() {
      widget.state_d1 = !widget.state_d1;
    });
    print(get_data_device());
    upload(get_data_device());

    // _manager.publish(parse_json_data(get_data_device()),"test");
  }

  void toggle_d2() {
    setState(() {
      widget.state_d2 = !widget.state_d2;
    });
    print(get_data_device());
    upload(get_data_device());
    // _manager.publish(parse_json_data(get_data_device()),"test");
  }

  void toggle_d3() {
    setState(() {
      widget.state_d3 = !widget.state_d3;
    });
    print(get_data_device());
    upload(get_data_device());
    //  _manager.publish(parse_json_data(get_data_device()),"test");
  }

  void toggle_d4() {
    setState(() {
      widget.state_d4 = !widget.state_d4;
    });
    print(get_data_device());
    upload(get_data_device());
    // _manager.publish(parse_json_data(get_data_device()),"test");
  }

  int get_data_device() {
    int data = 0;
    if (widget.state_d1) {
      data += 1;
    } else {
      data += 0;
    }
    if (widget.state_d2) {
      data += 2;
    } else {
      data += 0;
    }
    if (widget.state_d3) {
      data += 4;
    } else {
      data += 0;
    }
    if (widget.state_d4) {
      data += 8;
    } else {
      data += 0;
    }
    return data;
  }

  String textHolder = 'Door closed';

  void textFunction() {
    setState(() {
      if (widget.state_d1) {
        textHolder = 'Opening';
      } /*else if (widget.state_d2){
        textHolder = 'Closing';
      } else if (widget.state_d3){
        textHolder = 'Stop';
      } else if (widget.state_d4){
        textHolder = 'AAA';
      }*/

    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Center(
                child: Image.asset(
                  'assets/cua_cuon.jpg',
                  height: 200.0,
                  width: 200.0,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                    textHolder,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,)),
              ),
              const SizedBox(height: 16),
              const Text(
                'CONTROLLER',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      toggle_d1();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      width: 156,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: widget.state_d1 ? Colors.grey : Colors.white,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 6),
                          Image.asset('assets/up.png', height: 80, width: 80),
                          const SizedBox(height: 14),
                          Text('UP', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: widget.state_d1 ? Colors.white : Colors.black,
                          ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toggle_d2();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      width: 156,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: widget.state_d2 ? Colors.grey : Colors.white,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 6),
                          Image.asset(
                              'assets/power.png', height: 80, width: 80),
                          const SizedBox(height: 14),
                          Text(
                              'ON/OFF',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: widget.state_d2 ? Colors.white : Colors
                                    .black,
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      toggle_d3();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      width: 156,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: widget.state_d3 ? Colors.grey : Colors.white,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 6),
                          Image.asset('assets/down.png', height: 80, width: 80),
                          const SizedBox(height: 14),
                          Text('DOWN', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: widget.state_d3 ? Colors.white : Colors.black,
                          ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toggle_d4();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      width: 156,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: widget.state_d4 ? Colors.grey : Colors.white,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 6),
                          Image.asset('assets/stop.png', height: 80, width: 80),
                          const SizedBox(height: 14),
                          Text('STOP', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: widget.state_d4 ? Colors.white : Colors.black,
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  void upload(int data) {
    String jsonData = "{\"data\":$data}";
    try {
      widget.manager.publish(jsonData, "flutter_test");
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
