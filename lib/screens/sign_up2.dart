// import 'dart:async';
// import 'dart:convert';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:panchikawatta/components/custom_button.dart';
import 'package:panchikawatta/components/text_fields_widget.dart';
import 'package:panchikawatta/screens/Vehicledetails1.dart';
import 'package:panchikawatta/rest/rest_api.dart';

class sign_up2 extends StatefulWidget {
  
   
   @override
  _SignUp2State createState() => _SignUp2State();
}
class _SignUp2State extends State<sign_up2> {
  String? imagePath;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController businessAddressController =
      TextEditingController();
  final TextEditingController businessContactnoController =
      TextEditingController();
  final TextEditingController businessDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Fill your Profile",
                      style: TextStyle(
                        color: Color(0xFFFF5C01),
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Text(
                  "If you want to sell, fill this out",
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  controller: businessNameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Business Name",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  controller: businessAddressController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Business Address",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  cursorColor: Colors.black,
                  controller: businessContactnoController,
                  decoration: InputDecoration(
                    hintText: "Business contact no",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  cursorColor: Colors.black,
                  controller: businessDescriptionController,
                  decoration: InputDecoration(
                    hintText: "Business description",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 30),Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Vehicledetails1()),
                            );
                          },
                          text: 'Skip',
                        ),
                        CustomButton(
                          
                             onPressed: ()async {
                      dosave(
                        businessNameController.text,
                        businessAddressController.text,
                        businessContactnoController.text,
                        businessDescriptionController.text,
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
    );
  }

  void dosave(
    String businessName,
    String businessAddress,
    String businessContactno,
    String businessDescription,
  ) async {
    var res = await saveBusiness(
      businessName,
      businessAddress,
      businessContactno,
      businessDescription
    );
 

    print(res.toString());
  }
  
   
  
 
}





// import 'dart:io';
// import 'dart:math';

// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:panchikawatta/components/custom_button.dart';
// import 'package:panchikawatta/components/text_fields_widget.dart';
// import 'package:panchikawatta/screens/Vehicledetails1.dart';
// import 'package:panchikawatta/rest/rest_api.dart';

// class sign_up2 extends StatefulWidget {
//   @override
//   _SignUp2State createState() => _SignUp2State();
// }

// class _SignUp2State extends State<sign_up2> {
//   String? imagePath;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController BusinessNameController = TextEditingController();
//   final TextEditingController BusinessAddressController =
//       TextEditingController();
//   final TextEditingController BusinessContactnoController =
//       TextEditingController();
//   final TextEditingController BusinessDescriptionController =
//       TextEditingController();
//   void _savebusinessDetails() {
//     // Validate all required fields
//     if (BusinessNameController.text.isNotEmpty ||
//         BusinessAddressController.text.isNotEmpty ||
//         BusinessContactnoController.text.isNotEmpty ||
//         BusinessDescriptionController.text.isNotEmpty) {
//       dosave(
//         BusinessNameController.text,
//         BusinessAddressController.text,
//         BusinessContactnoController.text,
//         BusinessDescriptionController.text,
//       );
//       // Show an alert or message indicating fields are empty
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Vehicledetails1()),
//       );
//     } else {
//       // Proceed with saving the data (navigate to the next screen or save to backend)
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Missing Information"),
//             content: Text("Please fill in  fields to save."),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text("OK"),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 25),
//           child: Column(
//             children: <Widget>[
//               SizedBox(height: 40),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                 child: Row(
//                   children: [
                    
//                     SizedBox(width: 10),
//                     Text(
//                       "Fill your Profile",
//                       style: TextStyle(
//                         color: Color(0xFFFF5C01),
//                         fontSize: 28,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
//                 child: Text(
//                   "If you want to sell, fill this out",
//                   style: TextStyle(
//                     color: Color(0xFF000000),
//                     fontSize: 18,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//               TextFieldContainer(
//                 child: TextField(
//                   controller: BusinessNameController,
//                   cursorColor: Colors.black,
//                   decoration: InputDecoration(
//                     hintText: "Business Name",
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               TextFieldContainer(
//                 child: TextField(
//                   controller: BusinessAddressController,
//                   cursorColor: Colors.black,
//                   decoration: InputDecoration(
//                     hintText: "Business Address",
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               TextFieldContainer(
//                 child: TextField(
//                   cursorColor: Colors.black,
//                   controller: BusinessContactnoController,
//                   decoration: InputDecoration(
//                     hintText: "Business contact no",
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               TextFieldContainer(
//                 child: TextField(
//                   cursorColor: Colors.black,
//                   controller: BusinessDescriptionController,
//                   decoration: InputDecoration(
//                     hintText: "Business description",
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Vehicledetails1()),
//                       );
//                     },
//                     text: 'Skip',
//                   ),
//                   CustomButton(
//                     onPressed: () async {
//                       _savebusinessDetails();

//                       // Call function to save vehicle details
//                     },
//                     text: 'Save',
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void dosave(
//     String businessName,
//     String businessAddress,
//     String businessContactno,
//     String businessDescription,
//   ) async {
//     var res = await saveBusiness(
//         businessName, businessAddress, businessContactno, businessDescription);

//     print(res.toString());
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => Vehicledetails1()),
//     );
//   }

//   saveBusiness(String businessName, String businessAddress,
//       String businessContactno, String businessDescription) {}
// }
