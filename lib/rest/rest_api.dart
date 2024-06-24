import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:panchikawatta/constant/utils.dart';

//  Future userLogin(String Username, String Password) async {
//  final response = await http.post(
//    Uri.parse('${Utils.baseUrl}/user/login'),
//     headers: {"Accept": "Application/json"},
//     body: {'Username': Username, 'Password': Password},
//   );
//  }
Future<bool> loginWithToken(String? token) async {
  final response = await http.post(
    Uri.parse('${Utils.baseUrl}/api/auth/l'),
    headers: {
      "Accept": "Application/json",
      "Authorization": "Bearer $token",
    },
  );

  if (response.statusCode == 200) {
    return true; // Successful login with token
  } else {
    return false; // Login failed
  }
}

Future userRegister(
  String firstName,
  String lastName,
  String userName,
  String password,
  String email,
  String phoneNo, province, String district,
) async { 
  print("$password, $userName, $district, $email, $firstName, $lastName, $phoneNo, $province");
  final response = await http.post(
    Uri.parse('${Utils.baseUrl}/api/auth/'),
    headers: {
      "Accept": "Application/json"
    },
    body: {
      'firstName': firstName,
      'lastName': lastName,
      'Username': userName,
      'Password': password,
      'email': email,
      'phoneNo': phoneNo,
    },
  );
}

Future saveBusiness(
  businessName,
  businessAddress,
  businessContactno,
  businessDescription,
) async {
  final response = await http.post(
    Uri.parse('${Utils.baseUrl}/api/auth/cb'),
    headers: {"Accept": "Application/json"},
    body: {
      ' BusinessName': businessName,
      'BusinessAddress': businessAddress,
      'BusinessContactno': businessContactno,
      'Businessdescrption': businessDescription,
    },
  );
}
 

  Future VehicleD2(
    milagePerWeek,
    avgDistance,
    lastServiceDatePerWeek,
     batteryCondition
) async {
  final response = await http.post(
    Uri.parse('${Utils.baseUrl}/api/auth/cb'),
    headers: {"Accept": "Application/json"},
    body: {
        'milagePerWeek':milagePerWeek,
    'avgDistance':avgDistance,
    'lastServiceDatePerWeek':lastServiceDatePerWeek,
    'batteryCondition': batteryCondition
    },
  );

}
 Future VehicleD1(
     selectedType,
      selectedMake,
      selectedModel,
      vehicleName,
      licenseRenewalDate,
      insuranceRenewalDate,
      year,
) async {
  final response = await http.post(
    Uri.parse('${Utils.baseUrl}/api/auth/cb'),
    headers: {"Accept": "Application/json"},
    body: {
        'selectedType,' :selectedType,
      'selectedMak':selectedMake,
      'selectedModel':selectedModel,
      'vehicleName':vehicleName,
      'licenseRenewalDate':licenseRenewalDate,
      'insuranceRenewalDate':insuranceRenewalDate,
       'year':year,
    },
  );
  var decodedData = jsonDecode(response.body);
  return decodedData;
}
