import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DemoBuildContextPage extends StatefulWidget {
  const DemoBuildContextPage({Key? key}) : super(key: key);

  @override
  State<DemoBuildContextPage> createState() => _DemoBuildContextPageState();
}

class _DemoBuildContextPageState extends State<DemoBuildContextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Build Context"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Center(
          child: ContainerWidget(
            child: OngBa(
              child: ChaMe(
                child: ConCai(),
              ),
            ),
          )
        )
      ),
    );
  }
}

class ContainerWidget extends StatefulWidget {
  Widget child;

  ContainerWidget({required this.child});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {

  int count = 0;
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Count: $count"),
          Text("Message: $message"),
          ElevatedButton(onPressed: (){
            setState((){
              message += "a";
            });
          }, child: Text("Increase")),
          MyInheritedWidget(
              child: widget.child,
              count: count,
              message: message,
          )
        ],
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget{
  int count;
  String message;

  MyInheritedWidget({required super.child, required this.count, required this.message});

  static of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    return oldWidget.count != count;
  }

}

class OngBa extends StatefulWidget {
  String label = "OngBa label";
  Widget child;

  OngBa({required this.child});

  static of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<OngBa>();
  }

  @override
  State<OngBa> createState() => _OngBaState();
}

class _OngBaState extends State<OngBa> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ông Bà"),
            widget.child
          ],
        ),
      ),
    );
  }
}

class ChaMe extends StatefulWidget {
  Widget child;

  ChaMe({required this.child});

  @override
  State<ChaMe> createState() => _ChaMeState();
}

class _ChaMeState extends State<ChaMe> {
  @override
  Widget build(BuildContext context) {
    OngBa? ongBa = OngBa.of(context);
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Cha Mẹ"),
            widget.child
          ],
        ),
      );
  }
}

class ConCai extends StatefulWidget {
  @override
  State<ConCai> createState() => _ConCaiState();
}
class _ConCaiState extends State<ConCai> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Con cái"),
    );
  }
}