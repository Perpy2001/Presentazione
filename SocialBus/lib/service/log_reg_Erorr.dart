String regErrorHandler(String e){
  print(e);
   switch (e) {
     case"'package:firebase_auth/src/firebase_auth.dart': Failed assertion: line 61 pos 12: 'email != null': is not true.":
    {
    return "Inserire un email valida";
    }
  break;
  
  case "'package:firebase_auth/src/firebase_auth.dart': Failed assertion: line 62 pos 12: 'password != null': is not true.":
    {
    return "Inserire una pasword valida";
    }
  break;

case "package:firebase_auth/src/firebase_auth.dart': Failed assertion: line 62 pos 12: 'password != null":
    {
    return "Inserire un pasword valida";
    }
  break;
 
  case "Exception: null user":
    {
    return "Inserire un user valido";
    }
  break;

case "PlatformException(ERROR_INVALID_EMAIL, The email address is badly formatted., null)":
    {
    return "Inserire un email valida";
    }
  break;
   case "PlatformException(ERROR_EMAIL_ALREADY_IN_USE, The email address is already in use by another account., null)":
    {
    return "Email già in uso";
    }
  break;

 case "PlatformException(ERROR_WEAK_PASSWORD, The given password is invalid. [ Password should be at least 6 characters ], null)":
    {
    return "La password deve essere di minimo 6 caratteri";
    }
  break;
  default:
    {
    return "ERRORE REEGISTRAZIONE";
    }
   }}

String logErrorHandler(String e){
  print(e);
   switch (e) {
     
     case"'package:firebase_auth/src/firebase_auth.dart': Failed assertion: line 174 pos 12: 'email != null': is not true.":
    {
    return "Inserire un email valida";
    }
  break;
   case "'package:firebase_auth/src/firebase_auth.dart': Failed assertion: line 175 pos 12: 'password != null': is not true.":
    {
    return "Inserire una pasword valida";
    }
  break;
  
 case "PlatformException(ERROR_WRONG_PASSWORD, The password is invalid or the user does not have a password., null)":
    {
    return "Pasword errata";
    }
  break;
   case "PlatformException(ERROR_INVALID_EMAIL, The email address is badly formatted., null)":
    {
    return "Inserire un email valida";
    }
  break;
  case "PlatformException(ERROR_USER_NOT_FOUND, There is no user record corresponding to this identifier. The user may have been deleted., null)":
    {
    return "User inesistente";
    }
  break;
   default:
    {
    return "ERRORE LOG IN";
    }
   }
}