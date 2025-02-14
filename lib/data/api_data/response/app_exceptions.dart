

class AppExceptions implements Exception{

final String? _msg;
final String? _prefix;
AppExceptions([this._msg,this._prefix]);

@override
  String toString(){
  return "$_msg$_prefix";
}


}



class FetchDataException extends AppExceptions{
  FetchDataException([String? message]) : super(message, "Error during communication");
}

class BadRequestException extends AppExceptions{
  BadRequestException([String? message]) : super(message, "Invalid Request");
}

class UnAuthorizeException extends AppExceptions{
  UnAuthorizeException([String? message]) : super(message, "UnAuthorize Request");
}


class InValidException extends AppExceptions{
  InValidException([String? message]) : super(message, "InVaild input Request");
}

class InValidUrlException extends AppExceptions{
  InValidUrlException([String? message]) : super(message, "InVaild Url Request");
}

class InValidUserException extends AppExceptions{
  InValidUserException([String? message]) : super(message, "invalid user");
}


class RequestTimeOut extends AppExceptions{
  RequestTimeOut([String? message]) : super(message, "Request Time Out");
}

class InternetException extends AppExceptions{
  InternetException([String? message]) : super(message, "");
}

class ServerNotResponding extends AppExceptions{
  ServerNotResponding([String? message]) : super(message, "");
}

class UnAuthorized extends AppExceptions{
  UnAuthorized([String? message]) : super(message, "UnAuthorized");
}

