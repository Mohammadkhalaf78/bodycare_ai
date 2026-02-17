class EndPoint {
  static String baseUrl = "https://final-project-izjy.vercel.app";
  static String signIn = "/api/user/signIn";
  static String signUp = "/api/user/signUp";
  static String getDoctors = '/api/doctor';
  static String sendMessage = '/api/aichat/message';
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";
  static String age = 'age';
  static String gender = 'gender';
  static String address = 'address';
  static String data = 'data';
  static String text = 'text';
  static String reportData = 'reportData';
}