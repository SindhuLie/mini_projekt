import 'package:dio/dio.dart';
import 'models.dart';

class Services{
  Dio _dio = Dio();
  
  Future<List<Person>> getUserList() async{
    List<dynamic> personList = List<Person>();
    Response<Map> response = await _dio.get('https://reqres.in/api/users?page=2');
    Map responseBody = response.data;
    for (Map<String,dynamic> response in responseBody['data']){
      personList.add(Person.fromJson(response));
    }
    return personList;
  }

  Future<Person> getUser() async{
    Person person;
    Response<Map> response = await _dio.get('https://reqres.in/api/users/2');
    Map responseBody = response.data;
    person = Person.fromJson(responseBody['data']);
    return person;
  }

  Future logIn(String email, String password) async{
    Response response = await _dio.post(
        'https://reqres.in/api/login',
        data: {
          'email': email,
          'password': password,
        });
    return response.statusCode;
  }

}