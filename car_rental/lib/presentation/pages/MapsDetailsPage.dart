import 'package:car_rental/presentation/pages/car_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapsDetailsPage extends StatelessWidget {
  const MapsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
            onPressed: ()=>Navigator.pop(context),
          ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center:LatLng(51, -0.09),
              zoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
            ],
          ),
          //Aqui
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: carDetailsCard()
            ),
        ],
      ),
    );
  }
}

//Aqui
Widget carDetailsCard(){
  return SizedBox(
    height: 350,
    child: Stack(
      children:[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ]
          ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text('car_model', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.directions_car, color: Colors.white, size: 16,),
                  SizedBox(width: 5,),
                  Text(
                    '> car.distance km',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(width: 10,),
                  Icon(Icons.battery_full, color: Colors.white, size:14, ),
                  Text(
                    'car.fuelCapacity',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}