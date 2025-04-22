import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:car_rental/presentation/widgets/more_card.dart';
import 'package:flutter/material.dart';

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text(
              'Information'
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(car: Car(model: 'Fortuner GR', distance: 870, fuelCapacity: 50, pricePerHour: 45),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
              Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xffF3F3F3),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 10,
                    ),
                  ]
                ),
                child: Column(
                  children: [
                    CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/user.png'),),
                    SizedBox(height: 10,),
                    Text('Jane Cooper', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(' \$4,253', style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
            ),
            SizedBox(
              width:20,
            ),
            Expanded(
              child: Container(
                height: 170,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/maps.jpg'),
                  fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
              ),
            ),
              ],
              ),
          ),
          Container(
            child: Column(
              children: [
                MoreCard(car: Car(model: 'Fortuner GR', distance: 870, fuelCapacity: 50, pricePerHour: 45)),
                MoreCard(car: Car(model: 'Fortuner GR', distance: 870, fuelCapacity: 50, pricePerHour: 45)),
                MoreCard(car: Car(model: 'Fortuner GR', distance: 870, fuelCapacity: 50, pricePerHour: 45)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}