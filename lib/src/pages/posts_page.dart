
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_ceiba_software/src/model/users_model.dart';
import 'package:test_ceiba_software/src/utils/http_service.dart';


class PostPage extends StatefulWidget {
  final User ? user;
  const PostPage({ Key? key,  this.user }) : super(key: key, );

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
   List<Posts> posts = [];
   List<Posts> filteredPosts = [];
   List<User> user = [];

   @override
   void initState() {
     Services.getPostsByUserId(widget.user!.id).then((postsFromServer) {
       setState(() {
         posts = postsFromServer;
         filteredPosts = posts;
       });
     });
     super.initState();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text( widget.user!.name, style: const TextStyle(fontWeight: FontWeight.bold),
        ),
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
              hintText: "Ingrese titulo de la publicacion",
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
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                       children:[
                          ListTile(
                           leading: const Icon(Icons.person_outline, color: Color(0xff2A5F32),),
                           title: const Text('Autor', style: TextStyle(fontWeight: FontWeight.bold),),
                           subtitle: Text(widget.user!.name),
                         ),
                          ListTile(
                           leading: const Icon(Icons.phone_outlined, color: Color(0xff2A5F32),),
                           title:  const Text('Telefono', style: TextStyle(fontWeight: FontWeight.bold),),
                           subtitle: Text(widget.user!.phone),
                         ),
                          ListTile(
                           leading: const Icon(Icons.email_outlined, color: Color(0xff2A5F32),),
                           title: const Text('Correo Electronico', style: TextStyle(fontWeight: FontWeight.bold),),
                           subtitle: Text(widget.user!.email),
                         ),
                         const Text('Publicaciones', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        Expanded(
                          child: ListView.builder(
                            itemCount: filteredPosts.length,
                            itemBuilder: (BuildContext context, int index){
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children:[
                                        Row(
                                         children: [
                                          const FaIcon(
                                            FontAwesomeIcons.newspaper,
                                            size: 15,
                                            color: Color(0xff2A5F32),
                                          ),
                                          const Padding(padding: EdgeInsets.all(10)),
                                          SizedBox(
                                            height: 50,
                                            width: 250,
                                            child: AutoSizeText(
                                             filteredPosts[index].title,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal 
                                              ),
                                              maxLines: 2,
                                            ),
                                          ),
                                         ],
                                        ),     
                                      ]
                                    ),
                                  ),
                              );
                            }
                          ),
                        ),
                       ]
                    ),
                  ),
                ),
          )
        ],
      ),
    );
    
  }
    
}