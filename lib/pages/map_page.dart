import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List pages = [
    const ProfilePage(),
    const ChatPage(),
    const WalletPage(),
    const HomePage(),
  ];

  //Location _locationController = new Location();
  bool? _isChecked = false;
  bool? _isChecked1 = false;
  bool? _isChecked2 = false;

  static const LatLng _pGooglePlex = LatLng(39.9334, 32.8490);
  static const LatLng _pApplePark = LatLng(39.9320, 32.8597);
  static const LatLng _pApplePar = LatLng(39.9337, 32.8397);
  static const LatLng _pApplePa = LatLng(39.9340, 32.8447);
  static const LatLng _pAppleP = LatLng(39.9329, 32.8589);
  static const LatLng _pApple = LatLng(39.9304, 32.8340);
  static const LatLng _pAppl = LatLng(39.9354, 32.8500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(51, 58, 115, 4),
        title: Flexible(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.wallet_membership_outlined, color: Colors.white),
              Text(
                "1200 points",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              SizedBox(width: 45),
              Text(
                "gezginGÖR",
                style: TextStyle(fontSize: 20, color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 80),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings, color: Colors.white))
            ],
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            // Haritayı İçeren Container (Mavi Kenarlık)
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 600,
              // Haritanın yüksekliğini ve alt kenardan 200 birim mesafeyi ayarlayın
              child: Container(
                width: double.infinity, // Genişliği sonsuza ayarlayın
                //aspectRatio: 16 / 9,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.0, color: Color.fromRGBO(254, 251, 246,4)),
                  borderRadius: BorderRadius.circular(19.0),
                ),
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: _pGooglePlex,
                    zoom: 13,
                  ),
                  markers: {
                    const Marker(
                        markerId: MarkerId("_currentLocation"),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _pGooglePlex),
                    const Marker(
                        markerId: MarkerId("_currentLocation"),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _pApplePark),
                    const Marker(
                        markerId: MarkerId("_currentLocation"),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _pApplePar),
                    const Marker(
                        markerId: MarkerId("_currentLocation"),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _pApplePa),
                    const Marker(
                        markerId: MarkerId("_currentLocation"),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _pAppleP),
                    const Marker(
                        markerId: MarkerId("_currentLocation"),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _pApple),
                    const Marker(
                        markerId: MarkerId("_currentLocation"),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _pAppl),
                  },
                ),
              ),
            ),
            Positioned(
                left: 0,
                top: 130,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CSCPicker(
                    onCountryChanged: (country){} ,
                    onStateChanged: (state){},
                    onCityChanged: (city){},
                  ),
                )),
            Positioned(
              left: 0,
              top: 250,
              right: 0,
              bottom: 425,
              child: CheckboxListTile(
                title: Text('Müzeler'),
                value: _isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked = newValue;
                  });
                },
                activeColor: Color.fromRGBO(51, 58, 115, 4),
                checkColor: Color.fromRGBO(251, 168, 52, 4),
              ),
            ),
            Positioned(
              left: 0,
              top: 300,
              right: 0,
              bottom: 375,
              child: CheckboxListTile(
                title: Text('Aktiviteler'),
                value: _isChecked1,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked1 = newValue;
                  });
                },
                activeColor: Color.fromRGBO(51, 58, 115, 4),
                checkColor: Color.fromRGBO(251, 168, 52, 4),
              ),
            ),
            Positioned(
              left: 0,
              top: 350,
              right: 0,
              bottom: 325,
              child: CheckboxListTile(
                title: Text('Yemek'),
                value: _isChecked2,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked2 = newValue;
                  });
                },
                activeColor: Color.fromRGBO(51, 58, 115, 4),
                checkColor: Color.fromRGBO(251, 168, 52, 4),
              ),
            ),
            Positioned(
                left: 0,
                top: 150,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //SizedBox(width: 30),
                        TextButton(onPressed: () {}, child: Text("Accommodation")),
                        //SizedBox(width: 29,),
                        TextButton(onPressed: () {}, child: Text("Transportation")),
                        //SizedBox(width: 20),
                      ],
                    ),
                  ),
                )),

            // Row Ekleme (Altta 50 birim yüksekliğinde)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
            backgroundColor: Color.fromRGBO(51, 58, 115, 4),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat',
            backgroundColor: Colors.blueGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Wallet',
            backgroundColor: Colors.blueGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}

class HomePage {
  const HomePage();
}

class WalletPage {
  const WalletPage();
}

class ChatPage {
  const ChatPage();
}

class ProfilePage {
  const ProfilePage();
}
