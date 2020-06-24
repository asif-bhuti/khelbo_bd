import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  List<Marker> allMarkers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allMarkers.add(Marker(
      markerId: MarkerId('MyMarker'),
      draggable: false,
      onTap: () {
        _groundDetailBottomSheet(context);
      },
      position: LatLng(23.7893, 90.4103),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            markers: Set.from(allMarkers),
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(23.7893, 90.4103),
              zoom: 18.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ],
      ),
    );
  }
}

// Widget _popUpButton() {
// return Positioned(
//   bottom: 0.0,
//   child: Card(
//     color: Colors.white,
//     elevation: 10.0,
//     child: Container(
//       height: 100.0,
//       width: 350.0,
//       child: Column(
//         children: <Widget>[
//           Expanded(
//             child: Text('BWD Cricket Ground'),
//           )
//         ],
//       ),
//     ),
//   ),
// );
// }

void _groundDetailBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.18,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'BWD Cricket Ground',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text("Book Ground"), 
              onPressed: () {
                Navigator.pushNamed(context, '/booking');
              }
              )
            ],
          ),
        );
      });
}
