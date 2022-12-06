import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:whatsapp_share2/whatsapp_share2.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {

  String _phone = '917065363038';

  Future<void> share() async {
    await WhatsappShare.share(
      text: 'Example share text',
      linkUrl: 'https://flutter.dev/',
      phone: _phone,
    );
  }



  Future<void> isInstalled() async {
    final val = await WhatsappShare.isInstalled();
    print('Whatsapp is installed: $val');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Whatsapp Share'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text('Share text and link'),
                onPressed: share,
              ),
              ElevatedButton(
                child: Text('is Installed'),
                onPressed: isInstalled,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///Pick Image From gallery using image_picker plugin

}