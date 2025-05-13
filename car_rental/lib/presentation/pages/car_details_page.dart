import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/presentation/pages/MapsDetailsPage.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:car_rental/presentation/widgets/more_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarDetailsPage extends StatefulWidget {
  final Car car;

  const CarDetailsPage({super.key, required this.car});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller!, curve: Curves.easeInOut),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller?.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller?.forward();
        }
      });

    _controller?.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            SizedBox(width: 8),
            Text('Information'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarCard(car: widget.car),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/user.png'),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Jane Cooper',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${NumberFormat("#,##0.00").format(4253)}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapsDetailsPage(car: widget.car),
                          ),
                        );
                      },
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: AnimatedBuilder(
                          animation: _animation!,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _animation!.value,
                              child: child,
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/maps.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  MoreCard(
                    car: Car(
                      model: '${widget.car.model}-1',
                      distance: widget.car.distance + 100,
                      fuelCapacity: widget.car.fuelCapacity + 100,
                      pricePerHour: widget.car.pricePerHour + 10,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MoreCard(
                    car: Car(
                      model: '${widget.car.model}-2',
                      distance: widget.car.distance + 200,
                      fuelCapacity: widget.car.fuelCapacity + 200,
                      pricePerHour: widget.car.pricePerHour + 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MoreCard(
                    car: Car(
                      model: '${widget.car.model}-3',
                      distance: widget.car.distance + 300,
                      fuelCapacity: widget.car.fuelCapacity + 300,
                      pricePerHour: widget.car.pricePerHour + 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}