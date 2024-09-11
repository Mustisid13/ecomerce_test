import '../extensions/string_extension.dart';

class AppValidators{
  static String? validatePhoneNumber(String? value){
    if(value == null || value.isEmpty){
      return "Please enter your phone number";
    }
    if(value.length <10){
      return "Not a valid phone number";
    }
    return null;
  }

  static String? validateEmail(String? value){
    if(value == null || value.isEmpty){
      return "Please enter an email!";
    }
    if(!value.isValidEmail){
      return "Not a valid email!";
    }
    return null;
  }
  // static String? validatePassword(String? value){
  //   if(value == null || value.isEmpty){
  //     return "Please enter your password!";
  //   }
  //   return null;
  // }
  static String? validateCnfPassword(String? password,String? cnfPassword){
    if(password?.isEmpty??true){
      return "Please enter your password";
    }else if(password?.isNotEmpty??false){
      return null;
    }
    if(cnfPassword != password){
      return "Oops! password does not match";
    }
    return null;
  }
}