import 'package:flutter/material.dart';
import './functions.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  String msgWarning = "Enter a number";
  List finaleResult = ["0", "0", "0"];
  List bases = [2, 8, 16];
  Color colorWariningMsg = Colors.black;

  void setResult() {
    setState(() {
      try {
        final doubleResult = double.tryParse(_textEditingController.text);
        if (doubleResult == false) {
          throw FormatException('Enter a number dummy !!!');
        } else if (!(_textEditingController.text.isEmpty)) {
          for (int i = 0; i < 3; i++) {
            finaleResult[i] = ConverterBase(
                bases[i], double.parse(_textEditingController.text));
          }
          colorWariningMsg = Colors.black;
          msgWarning = "";
        }
      } catch (e) {
        msgWarning = "You need to Enter a number dummy !!!";
        colorWariningMsg = Colors.red;
      }
    });
  }

  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Base Converter")),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffefeedc),
          ),
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 80.0,
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    labelText: 'Enter a value',
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  msgWarning,
                  style: TextStyle(color: colorWariningMsg, fontSize: 20),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff13a847), // Background color
                  ),
                  onPressed: () => setResult(),
                  child: Text("Convert"),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5), color: Color(0xffe9ecef)),
                alignment: Alignment.center,
                child: Text(finaleResult[0]),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5), color: Color(0xffe9ecef)),
                alignment: Alignment.center,
                child: Text(finaleResult[1]),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5), color: Color(0xffe9ecef)),
                alignment: Alignment.center,
                child: Text(finaleResult[2]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
