class Validation{
  static String validatePass(String pass){
    if(pass==null){
      return "Password invalid";
    }
    if(pass.length<6){
      return "Password require minimum 6 characters";
    }
    return null;
  }
  static String validateEmail(String email){
    if(email==null){
      return "Email invalid";
    }
    if(email.length<6){
      return "Email require minimum 6 characters";
    }
    return null;
  }
}