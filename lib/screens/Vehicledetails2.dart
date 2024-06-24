import 'dart:io';
import 'package:flutter/material.dart';
import 'package:panchikawatta/components/custom_button.dart';
import 'package:panchikawatta/components/input_fields.dart';
import 'package:panchikawatta/main.dart';
import 'package:panchikawatta/rest/rest_api.dart';

import 'package:panchikawatta/screens/Vehicledetails1.dart';

class Vehicledetails2 extends StatefulWidget {
  final String? selectedPhotoPath;

  Vehicledetails2({
    Key? key,
    this.selectedPhotoPath,
  }) : super(key: key);

  @override
  _Vehicledetails2State createState() => _Vehicledetails2State();
}

class _Vehicledetails2State extends State<Vehicledetails2> {
  String? selectedPhotoPath;
  TextEditingController milagePerWeekController = TextEditingController();
  TextEditingController avgDistanceController = TextEditingController();
  TextEditingController lastServiceDatePerWeekController =
      TextEditingController();
  TextEditingController batteryConditionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    selectedPhotoPath = widget.selectedPhotoPath;
  }

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Vehicle Details',
          style: TextStyle(color: Color(0xFFFF5C01), fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 150,
                width: 200,
                child: Stack(
                  children: [
                    if (selectedPhotoPath != null)
                      Positioned.fill(
                        child: Image.file(
                          File(selectedPhotoPath!),
                          fit: BoxFit.cover,
                        ),
                      )
                    else
                      Positioned.fill(
                        child: Image.asset(
                          'lib/src/img/vehicleDetails.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.1,
                0,
                MediaQuery.of(context).size.width * 0.1,
                0,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputFields(
                      controller: milagePerWeekController,
                      hintText: 'Mileage',
                      width1: 0.8,
                    ),
                    const SizedBox(height: 20),
                    InputFields(
                      controller: avgDistanceController,
                      hintText: 'Avg distance per week',
                      width1: 0.8,
                    ),
                    const SizedBox(height: 20),
                    InputFields(
                      controller: lastServiceDatePerWeekController,
                      hintText: 'Last Service date',
                      width1: 0.8,
                    ),
                    const SizedBox(height: 20),
                    InputFields(
                      controller: batteryConditionController,
                      hintText: 'Battery Condition',
                      width1: 0.8,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ClipRRect(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Vehicledetails1(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 249, 248, 247),
                            ),
                          ),
                          child: Text(
                            "+ Add Vehicle",
                            style: TextStyle(
                              color: Color.fromARGB(255, 234, 137, 9),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                          },
                          text: 'skip',
                        ),
                        CustomButton(
                          onPressed: () async {
                            Vehicle(
                                milagePerWeekController.text,
                                avgDistanceController.text,
                                lastServiceDatePerWeekController.text,
                                batteryConditionController.text);

                                 Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()), // Replace with your MyHomePage widget
    );
                            // Call function to save vehicle details
                          },
                          text: 'Save',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void Vehicle(
     String  milagePerWeek,
    String avgDistance,
    String lastServiceDatePerWeek,
    String batteryCondition,
  ) async {
    var res = await VehicleD2(
    milagePerWeek,
    avgDistance,
    lastServiceDatePerWeek,
     batteryCondition
    );
 

    print(res.toString());
  }
  