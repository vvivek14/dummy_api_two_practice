import 'package:dummy_api_two_practice/database/serverFile.dart';
import 'package:dummy_api_two_practice/pages/profilFull.dart';
import 'package:dummy_api_two_practice/userData/userDetails.dart';
import 'package:flutter/material.dart';

import 'postDetails/post_album_todos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AllUsers> userDetails = [];

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  void getUserDetails() async {
    userDetails = (await Apicalling().allUserData())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: userDetails.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserPosts(
                          id: userDetails[index].id.toString(),
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    color: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.blue.shade200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ID :- ${userDetails[index].id.toString()}"),
                              const SizedBox(height: 8),
                              Text(
                                  "NAME :- ${userDetails[index].name.toString()}",
                                  overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 8),
                              Text(
                                  "EMAIL :- ${userDetails[index].email.toString()}",
                                  overflow: TextOverflow.ellipsis),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfilePage(
                                        objectData: userDetails[index]),
                                  ));
                            },
                            icon: const Icon(Icons.person, color: Colors.teal),
                            splashColor: Colors.teal.withOpacity(.5),
                            splashRadius: 30,
                            iconSize: 26,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
