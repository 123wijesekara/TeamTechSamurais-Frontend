//  import 'dart:io'; // Import dart:io for File handling
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:panchikawatta/screens/Vehicledetails2.dart';
// import 'package:panchikawatta/components/custom_button.dart';
// import 'package:panchikawatta/components/input_fields.dart';

// class Vehicledetails1 extends StatefulWidget {
//   @override
//   _AddVehicleDetailsState createState() => _AddVehicleDetailsState();
// }

// class _AddVehicleDetailsState extends State<Vehicledetails1> {
//   final TextEditingController licenseRenewalDateController = TextEditingController();
//   final TextEditingController insuranceRenewalDateController = TextEditingController();
//   final TextEditingController firstNameController = TextEditingController();
//   final ImagePicker _picker = ImagePicker();
//   String? selectedPhotoPath; // Variable to store the selected photo path

//   List<String> vehicleTypes = ['Car', 'Truck', 'SUV']; // Example vehicle types
//   String selectedType = 'Car'; // Default selected type

//   List<String> vehicleMakes = ['Toyota', 'Honda', 'Ford']; // Example vehicle makes
//   String selectedMake = 'Toyota'; // Default selected make

//   List<String> vehicleModels = ['Camry', 'Accord', 'F-150']; // Example vehicle models
//   String selectedModel = 'Camry'; // Default selected model

//   Future<void> _uploadFromGallery() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         selectedPhotoPath = pickedFile.path;
//       });
//     }
//   }

//   Future<void> _takePhoto() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       setState(() {
//         selectedPhotoPath = pickedFile.path;
//       });
//     }
//   }

//   Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (pickedDate != null) {
//       setState(() {
//         controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     Map<String, String?>? data = ModalRoute.of(context)!.settings.arguments as Map<String, String?>?;

//     String fname = data?['firstname'] ?? '';
//     String lname = data?['lastname'] ?? '';
//     String username = data?['username'] ?? '';
//     String password = data?['password'] ?? '';
//     String email = data?['email'] ?? '';
//     String phoneno = data?['phoneno'] ?? '';
//     String? district = data?['district'];
//     String? province = data?['province'];
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text('Vehicle Details', style: TextStyle(color: Color(0xFFFF5C01), fontSize: 28)),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Container(
//                 height: 150,
//                 width: 200,
//                 child: Stack(
//                   children: [
//                     if (selectedPhotoPath != null)
//                       Positioned.fill(
//                         child: Image.file(
//                           File(selectedPhotoPath!),
//                           fit: BoxFit.cover,
//                         ),
//                       )
//                     else
//                       Positioned.fill(
//                         child: Image.asset(
//                           'lib/src/img/vehicleDetails.jpeg',
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     Positioned(
//                       bottom: -20,
//                       right: -10,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: IconButton(
//                           icon: Icon(Icons.file_upload, color: Colors.black, size: 30),
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   title: Text("Upload Options"),
//                                   content: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       ListTile(
//                                         leading: Icon(Icons.photo_library),
//                                         title: Text('Upload from Gallery'),
//                                         onTap: () {
//                                           Navigator.pop(context);
//                                           _uploadFromGallery();
//                                         },
//                                       ),
//                                       ListTile(
//                                         leading: Icon(Icons.camera_alt),
//                                         title: Text('Take a Photo'),
//                                         onTap: () {
//                                           Navigator.pop(context);
//                                           _takePhoto();
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: EdgeInsets.fromLTRB(
//                 MediaQuery.of(context).size.width * 0.1, // left
//                 0, // top
//                 MediaQuery.of(context).size.width * 0.1, // right
//                 0, // bottom
//               ),
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     InputFields(hintText: 'Vehicle Name', width1: 0.5),
//                     const SizedBox(height: 15),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: InputFields(
//                             hintText: 'Type',
//                             width1: 0.38,
//                             suffixIcon: Icon(
//                               Icons.arrow_drop_down,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: InputFields(
//                             hintText: 'Make',
//                             width1: 0.38,
//                             suffixIcon: Icon(
//                               Icons.arrow_drop_down,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: InputFields(
//                             hintText: 'Model',
//                             width1: 0.38,
//                             suffixIcon: Icon(
//                               Icons.arrow_drop_down,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: InputFields(hintText: 'Year', width1: 0.38),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.8,
//                       child: const Divider(
//                         color: Colors.black,
//                         thickness: 1,
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     const Text(
//                       'License Renewal Date',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Color(0xFF000000),
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                     InputFields(
//                       controller: licenseRenewalDateController,
//                       hintText: 'DD/MM/YY',
//                       width1: 0.8,
//                       suffixIcon: Icon(
//                         Icons.calendar_today,
//                         color: Colors.grey,
//                         size: 24,
//                       ),
//                       onPressed: () => _selectDate(context, licenseRenewalDateController),
//                     ),
//                     const SizedBox(height: 15),
//                     const Text(
//                       'Vehicle insurance renewal date',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Color(0xFF000000),
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                     InputFields(
//                       controller: insuranceRenewalDateController,
//                       hintText: 'DD/MM/YY',
//                       width1: 0.8,
//                       suffixIcon: Icon(
//                         Icons.calendar_today,
//                         color: Colors.grey,
//                         size: 24,
//                       ),
//                       onPressed: () => _selectDate(context, insuranceRenewalDateController),
//                     ),
//                     const SizedBox(height: 40),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CustomButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Vehicledetails2(
//                                   selectedPhotoPath: selectedPhotoPath,
//                                   usernameController: TextEditingController(),
//                                   passwordController: TextEditingController(),
//                                   emailController: TextEditingController(),
//                                 ),
//                                 settings: RouteSettings(
//                                   arguments: {'firstname': firstNameController.text},
//                                 ),
//                               ),
//                             );
//                           },
//                           text: 'Skip',
//                         ),
//                         CustomButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Vehicledetails2(
//                                   selectedPhotoPath: selectedPhotoPath,
//                                   usernameController: TextEditingController(),
//                                   passwordController: TextEditingController(),
//                                   emailController: TextEditingController(),
//                                 ),
//                               ),
//                             );
//                           },
//                           text: fname,
//                         ),
//                       ],
//                     ), // Input fields and other widgets...
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
  import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panchikawatta/screens/Vehicledetails2.dart';
import 'package:panchikawatta/components/custom_button.dart';
import 'package:panchikawatta/components/input_fields.dart';


 Map<String, List<String>> vehicleMakes = {
  'Car': ['Toyota', 'Honda', 'Nissan'],
  'Motorcycle': ['Honda', 'Yamaha', 'Suzuki'],
  'Three-Wheeler (Tuk Tuk)': ['Bajaj', 'Piaggio', 'TVS'],
  'Truck': ['Ford', 'Chevrolet', 'Dodge'],
  'Bus': ['Volvo', 'Mercedes-Benz', 'MAN'],
  'Van': ['Ford Transit', 'Mercedes-Benz Sprinter', 'Toyota Hiace'],
  'SUV': ['Jeep', 'Ford', 'Land Rover'],
  'Pickup Truck': ['Ford F-150', 'Chevrolet Silverado', 'Toyota Tacoma'],
  
};

 Map<String, List<String>> vehicleModels = {
  'Toyota': ['Corolla', 'Camry', 'Rav4'],
  'Honda': ['Civic', 'Accord', 'CR-V'],
  'Nissan': ['Altima', 'Sentra', 'Rogue'],
  'Ford': ['Fusion', 'Escape', 'Explorer'],
  'Chevrolet': ['Malibu', 'Equinox', 'Tahoe'],
  'Dodge': ['Charger', 'Durango', 'Ram 1500'],
  'Jeep': ['Wrangler', 'Grand Cherokee', 'Cherokee'],
  'Land Rover': ['Range Rover', 'Discovery', 'Defender'],
};

 List<String> vehicleTypes = [
  'Car',
  'Motorcycle',
  'Three-Wheeler (Tuk Tuk)',
  'Truck',
  'Bus',
  'Van',
  'SUV',
  'Pickup Truck',
  'Convertible',
  'Hatchback',
   
 
  
];

class Vehicledetails1 extends StatefulWidget {
  @override
  _AddVehicleDetailsState createState() => _AddVehicleDetailsState();
}

class _AddVehicleDetailsState extends State<Vehicledetails1> {
  final ImagePicker _picker = ImagePicker();
  String? selectedPhotoPath; 
  String? selectedType;
  String? selectedMake;
  String? selectedModel;

  
  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController licenseRenewalDateController = TextEditingController();
  TextEditingController insuranceRenewalDateController = TextEditingController();
 TextEditingController yearController = TextEditingController();
  Future<void> _uploadFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedPhotoPath = pickedFile.path;
      });
    }
  }

  Future<void> _takePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        selectedPhotoPath = pickedFile.path;
      });
    }
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

   
  void _saveVehicleDetails() {
    // Validate all required fields
    if (vehicleNameController.text.isNotEmpty &&
        selectedType != null &&
        selectedMake != null &&
        selectedModel != null &&
        licenseRenewalDateController.text.isNotEmpty &&
        insuranceRenewalDateController.text.isNotEmpty) {
      VehicleD1(
        selectedPhotoPath,
        selectedType!,
        selectedMake!,
        selectedModel!,
        vehicleNameController.text,
        licenseRenewalDateController.text,
        insuranceRenewalDateController.text,
        yearController.text,
      );
      
      // Proceed with navigating to next screen or saving data
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Vehicledetails2()),
      );
    } else {
      // Show an alert or message indicating fields are empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Missing Information"),
            content: Text("Please fill in all fields to save."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
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
        title: const Text('Vehicle Details', style: TextStyle(color: Color(0xFFFF5C01), fontSize: 28)),
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
                    Positioned(
                      bottom: -20,
                      right: -10,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                          icon: Icon(Icons.file_upload, color: Colors.black, size: 30),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Upload Options"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        leading: Icon(Icons.photo_library),
                                        title: Text('Upload from Gallery'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          _uploadFromGallery();
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.camera_alt),
                                        title: Text('Take a Photo'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          _takePhoto();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.1, // left
                0, // top
                MediaQuery.of(context).size.width * 0.1, // right
                0, // bottom
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputFields(
                      controller: vehicleNameController,
                      hintText: 'Vehicle Name',
                      width1: 0.5,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Dropdown for Type
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: selectedType,
                            hint: Text('Type'),
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                                selectedMake = null; // Reset selected make when type changes
                              });
                            },
                            items: vehicleTypes.map((type) {
                              return DropdownMenuItem<String>(
                                value: type,
                                child: Text(type),
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: selectedMake,
                            hint: Text('Make'),
                            onChanged: (value) {
                              setState(() {
                                selectedMake = value;
                                selectedModel = null; // Reset selected model when make changes
                              });
                            },
                            
                            items: selectedType != null && vehicleMakes[selectedType!] != null
                                ? vehicleMakes[selectedType!]!.map((make) {
                                    return DropdownMenuItem<String>(
                                      value: make,
                                      child: Text(make),
                                    );
                                  }).toList()
                                : [],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Dropdown for Model
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: selectedModel,
                            hint: Text('Model'),
                            onChanged: (value) {
                              setState(() {
                                selectedModel = value;
                              });
                            },
                            items: selectedMake != null && vehicleModels[selectedMake!] != null
                                ? vehicleModels[selectedMake!]!.map((model) {
                                    return DropdownMenuItem<String>(
                                      value: model,
                                      child: Text(model),
                                    );
                                  }).toList()
                                : [],
                          ),
                        ),
                        InputFields(
                         controller: yearController,
                         hintText: 'Year',
                         width1: 0.4,
                      ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'License Renewal Date',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    InputFields(
                      controller: licenseRenewalDateController,
                      hintText: 'DD/MM/YY',
                      width1: 0.8,
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                        size: 24,
                      ),
                      onPressed: () => _selectDate(context, licenseRenewalDateController),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Vehicle insurance renewal date',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    InputFields(
                      controller: insuranceRenewalDateController,
                      hintText: 'DD/MM/YY',
                      width1: 0.8,
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                        size: 24,
                      ),
                      onPressed: () => _selectDate(context, insuranceRenewalDateController),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Vehicledetails2()),
                            );
                          },
                          text: 'Skip',
                        ),
                        CustomButton(
                          onPressed: () {
                            _saveVehicleDetails(); // Call function to save vehicle details
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

Future<void> VehicleD1(
  String? selectedPhotoPath,
  String selectedType,
  String selectedMake,
  String selectedModel,
  String vehicleName,
  String licenseRenewalDate,
  String insuranceRenewalDate,
  String year,
) async {
  // Example of making an API call to save the vehicle details
  try {
    // Assuming you have a function in RestApi class to make the API call
   var res = await VehicleD1(
      selectedPhotoPath,
      selectedType,
      selectedMake,
      selectedModel,
      vehicleName,
      licenseRenewalDate,
      insuranceRenewalDate,
      year,
    );
  } catch (e) {
    print('Error saving vehicle details: $e');
    // Handle error (e.g., show a snackbar or alert dialog)
  }
}
 