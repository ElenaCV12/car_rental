import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
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
          Container(
            child: Column(
              children: [
                CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/user.png'),),
                SizedBox(height: 10,),
                Text('Jane Cooper', style: TextStyle(fontWeight: FontWeight.bold),),
                Text(' \$4,253', style: TextStyle(color: Colors.grey),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}