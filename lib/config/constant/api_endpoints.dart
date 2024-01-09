class ApiEndpoints{
  //prevents the instantiation of the ApiEndpoints class and is commonly used in Dart 
  //for defining classes that only contain static members 
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration recieveTimeout = Duration(seconds: 1000);

  //For Windows Base URL
  // static const String baseUrl = 'http://10.0.2.2:3000/api/';
  // For MAC
  static const String baseUrl = "http://localhost:5500/api/";

// ================================ Auth Routes ==================================
  static const String signUp = '/signUp';
  static const String signIn = '/signIn';
  
}