import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

getCoordinates(String from, String to) async {
  Dio dio = Dio();
  final Coordinates = await dio.post(
      "https://b8b2-2409-40d0-2a-3fb2-3c4f-3a4f-e4e7-2e49.in.ngrok.io/api",
      data: {"from": from, "to": to});
  print(Coordinates.data[0]);
  List<LatLng> list = Coordinates.data.map(
      (coordinate) => LatLng(coordinate['latitude'], coordinate['longitude']));
  return list;
}
