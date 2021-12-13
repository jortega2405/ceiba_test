

import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:test_ceiba_software/src/model/users_model.dart';
import 'package:test_ceiba_software/src/utils/http_service.dart';

import 'posts_page.dart';


class HomePage extends StatefulWidget {
  
  const HomePage({ Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   List<User> users = [];
   List<User> filteredUsers = [];
   late final User user;

  @override
  void initState() {
    super.initState();
    Services.getUsers().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        filteredUsers = users;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba de Ingreso'),
        backgroundColor: const Color(0xff2A5F32),
      ),
      body: Column(
        children: [
          TextField(
              style: const TextStyle(
                color: Color(0xff2A5F32),
              ),
              decoration: const InputDecoration(
              fillColor: Color(0xff2A5F32),
              contentPadding: EdgeInsets.all(15.0),
              hintText: "Ingrese nombre, telefono o email...",
              icon: Icon(Icons.search, color: Color(0xff2A5F32) )
            ),
            onChanged: (string) {
              setState(() {
                filteredUsers = users
                 .where((u) => (
                    u.name.toLowerCase().contains(string.toLowerCase()) ||
                    u.phone.toLowerCase().contains(string.toLowerCase()) ||
                    u.email.toLowerCase().contains(string.toLowerCase())
                   )).toList();
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                       children:[
                                 Row(
                                   children: [
                                     Text(
                                       filteredUsers[index].name,
                                       style: const TextStyle(
                                         color: Color(0xff2A5F32),
                                         fontSize: 16,
                                         fontWeight: FontWeight.bold 
                                       ),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(height: 10.0),
                                 Row(
                                   children: [
                                     const Icon(Icons.phone_outlined, color: Color(0xff2A5F32)),
                                     Text(
                                       filteredUsers[index].phone,
                                       style: const TextStyle(
                                         fontSize: 14,
                                       )
                                     )
                                   ],
                                 ),
                                 const SizedBox(height: 10.0),
                                 Row(
                                   children: [
                                     const Icon(Icons.email_outlined, color: Color(0xff2A5F32)),
                                     Text(
                                       filteredUsers[index].email,
                                       style: const TextStyle(
                                         fontSize: 14,
                                       )
                                     )
                                   ],
                                 ),    
                                 Row(
                                   children: [
                                     const SizedBox(width: 150),
                                     TextButton(
                                       onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const PostPage()),
                                          );
                                       },
                                       child: const Text(
                                        'Ver Publicaciones',
                                        style: TextStyle(
                                          color: Color(0xff2A5F32),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                     ),
                                   ],
                                 ),       
                       ]
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      
    );
  }
  

}