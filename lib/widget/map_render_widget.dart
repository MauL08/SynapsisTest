import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;

class MapRenderWidget extends StatelessWidget {
  const MapRenderWidget(
      {Key? key,
      required this.latitude,
      required this.longitude,
      required this.height,
      this.width})
      : super(key: key);

  final double latitude;
  final double longitude;
  final double height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FlutterMap(
        mapController: MapController(),
        options: MapOptions(
          center: latlng.LatLng(
            latitude,
            longitude,
          ),
          zoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                  point: latlng.LatLng(
                    latitude,
                    longitude,
                  ),
                  builder: (context) {
                    return const Icon(
                      Icons.location_on,
                      color: Colors.red,
                    );
                  })
            ],
          )
        ],
      ),
    );
  }
}
