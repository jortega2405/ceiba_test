



import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:test_ceiba_software/src/model/users_model.dart';
import 'package:test_ceiba_software/src/pages/user_details.dart';
import 'package:test_ceiba_software/src/utils/http_service.dart';


class PostPage extends StatefulWidget {
  
  const PostPage({ Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
   List<Posts> posts = [];
   List<Posts> filteredPosts = [];
   List<User> user = [];

  @override
  void initState() {
    Services.getPosts().then((postsFromServer) {
      setState(() {
        posts = postsFromServer;
        filteredPosts = posts;
      });
    super.initState();
    
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
                filteredPosts = posts
                 .where((u) => (
                    u.title.toLowerCase().contains(string.toLowerCase())
                   )).toList();
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: filteredPosts.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                       children:[
                                 Row(
                                   children: [
                                     Center(
                                       child: SizedBox(
                                         height: 50,
                                         width: 300,
                                         child: AutoSizeText(
                                           filteredPosts[index].title,
                                           style: const TextStyle(
                                             color: Color(0xff2A5F32),
                                             fontSize: 16,
                                             fontWeight: FontWeight.bold 
                                           ),
                                           maxLines: 2,
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