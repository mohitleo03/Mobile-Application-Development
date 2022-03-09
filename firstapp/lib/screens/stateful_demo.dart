import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class stateful_demo extends StatefulWidget {
  @override
  State<stateful_demo> createState() => _stateful_demoState();
}

class _stateful_demoState extends State<stateful_demo> {
  late int _count;
  _plus() {
    _count++;
    print("Count value is $_count");
    setState(() {});
  }

  @override
  void initState() {
    _count = 0;
    // TODO: implement initState
    super.initState();
    print("State init...");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("for external state/data...");
  }

  @override
  void didUpdateWidget(covariant stateful_demo oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("for checking the changes in widget tree...");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("State is cleaned here...");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("UI/build is cleaned here...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful Demo"),
      ),
      body: Center(
        child:
            Text("Count is $_count", style: GoogleFonts.pacifico(fontSize: 30)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _plus();
        },
        child: Text(
          "+",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
