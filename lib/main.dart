import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {},
        ),
        title: Text('Google maps'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: <Widget>[_googleMap(context), _buildContainer()],
      ),
    );
  }

  Widget _googleMap(BuildContext context) {
    Marker maputoMarker = Marker(
        markerId: MarkerId('maputo1'),
        position: LatLng(-25.974450, 32.574190),
        infoWindow: InfoWindow(title: 'Teste de Nelson'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));

    Marker maputoMarker1 = Marker(
        markerId: MarkerId('maputo1'),
        position: LatLng(-25.974771, 32.573686),
        infoWindow: InfoWindow(title: 'Teste de Nelson'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));

    Marker maputoMarker2 = Marker(
        markerId: MarkerId('maputo1'),
        position: LatLng(-25.975230, 32.575874),
        infoWindow: InfoWindow(title: 'Teste de Nelson'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(-25.8962418, 32.5406435), zoom: 16),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {maputoMarker, maputoMarker1, maputoMarker2},
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Padding(
                padding: EdgeInsets.all(1),
                child: _boxes(
                    'https://lh5.googleusercontent.com/p/AF1QipOtrBXLruJqUfje_M7OJ9RrwEXVdViBj7ls2yhm=w408-h544-k-no',
                    -25.9734975,
                    32.5910664,
                    'Restaurante Lugar e Meio')),
            SizedBox(
              width: 10,
            ),
            Padding(
                padding: EdgeInsets.all(1),
                child: _boxes(
                    'https://lh5.googleusercontent.com/p/AF1QipPPqUiNYZlIOvsjlsmIauJZY5ow77Lejfa02hBd=w408-h306-k-no',
                    -25.9733269,
                    32.5910834,
                    'Dolce Vita')),
            SizedBox(
              width: 10,
            ),
            Padding(
                padding: EdgeInsets.all(1),
                child: _boxes(
                    'https://lh5.googleusercontent.com/p/AF1QipOCSsrwqN0TrCaJa_oZbl_GQJ8R-eI9dHjpsE_k=w408-h306-k-no',
                    -25.9733337,
                    32.5910234,
                    'MIA GELATO')),
            SizedBox(
              width: 10,
            ),
            Padding(
                padding: EdgeInsets.all(1),
                child: _boxes(
                    'https://lh5.googleusercontent.com/p/AF1QipOM721akPvp1ppRutjauW8YdJsviIfrsE5MOhFs=w408-h306-k-no',
                    -25.9711059,
                    32.5911862,
                    'The Backroom')),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String image, double latitude, double logitude, String name) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(latitude, logitude);
      },
      child: Container(
        child: FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 180,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(image),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: detailsContainer(name),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget detailsContainer(String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              name,
              style: TextStyle(
                  color: Color(0xFF6200ee),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text(
                  '4.1',
                  style: TextStyle(color: Colors.black54, fontSize: 18.0),
                ),
              ),
              Container(
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  Icons.star_half,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Text(
                  'Maputense',
                  style: TextStyle(fontSize: 18.0, color: Colors.black54),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                child: Text(
                  'Closed map',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Future<void> _gotoLocation(double latitude, double logitude) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(latitude, logitude),
        zoom: 15,
        tilt: 50.0,
        bearing: 45.0)));
  }
}
