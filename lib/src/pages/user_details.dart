
import 'package:flutter/material.dart';
import 'package:test_ceiba_software/src/model/users_model.dart';
import 'package:test_ceiba_software/src/utils/http_service.dart';


class UserDetails extends StatefulWidget {
 
  
  const UserDetails({ Key? key,}) : super(key: key);
  
  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Publicaciones'
        ),
        backgroundColor: const Color(0xff2A5F32),
      ),
    );
  }
}
