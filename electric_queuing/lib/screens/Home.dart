import 'dart:async';
import '../config/services.dart';
import 'package:electric_queuing/config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  List<LatLng> list = [];
  final Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.4595, 77.0266),
    zoom: 8,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  getDirections() async {
    list = await getCoordinates(fromController.text, toController.text);
    BitmapDescriptor charging_station_icon =
        await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(52, 52)),
            'assets/charging-station.bmp');
    int i = 0;
    int j = 0;
    Constants.coordinates.forEach((coordinate) async {
      String markerIdVal = 'marker_id_$i';
      final MarkerId markerId = MarkerId(markerIdVal);
      final Marker marker = Marker(
        icon: Constants.coordinates.length - 1 == i || i == 0
            ? BitmapDescriptor.defaultMarker
            : charging_station_icon,
        markerId: markerId,
        position: list[i],
      );
      i++;
      markers[markerId] = marker;
    });
    final String polylineIdVal = 'polyline_id_$j';
    j++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.orange,
      width: 5,
      points: list,
    );
    polylines[polylineId] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140,
        title: Column(
          children: [
            Row(
              children: [
                const Text(
                  "From",
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  height: 50,
                  width: deviceSize.width - 100,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: fromController,
                    decoration: const InputDecoration(
                        hintText: 'City, State, Country',
                        border: InputBorder.none),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "To",
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  height: 50,
                  width: deviceSize.width - 100,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: toController,
                    decoration: const InputDecoration(
                        hintText: 'City, State, Country',
                        border: InputBorder.none),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: GoogleMap(
        padding: EdgeInsets.only(right: deviceSize.width - 60),
        // mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(markers.values),
        polylines: Set<Polyline>.of(polylines.values),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: Visibility(
        visible: fromController.text.isNotEmpty && toController.text.isNotEmpty,
        child: FloatingActionButton.extended(
          onPressed: getDirections,
          label: const Text('Find Route'),
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
