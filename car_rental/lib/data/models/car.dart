class Car {
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;

  Car({required this.model, required this.distance, required this.fuelCapacity, required this.pricePerHour});

factory Car.fromMap(Map<String, dynamic> map) {
  return Car(
    model: map['model'],
    distance: map['distance'].toDouble(), // Conversión explícita
    fuelCapacity: map['fuelCapacity'].toDouble(), // Conversión explícita
    pricePerHour: map['pricePerHour'].toDouble() // Conversión explícita
  );
}

}

// 1- domain/entities
// 2- domain/repositories (interface/contract)
// 3- domain/usescases getCarById getCarByName

// 1- data/models
// 2- domain/datasources (fetch api/firebase)
// 3- domain/repositories