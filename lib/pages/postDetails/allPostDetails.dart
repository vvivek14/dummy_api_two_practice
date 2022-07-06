import 'package:dio/dio.dart';
import 'package:dummy_api_two_practice/database/serverFile.dart';
import 'package:dummy_api_two_practice/pages/postDetails/comment.dart';
import 'package:dummy_api_two_practice/userData/userDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AllPostDetails extends StatefulWidget {
  final String id;
  const AllPostDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<AllPostDetails> createState() => _AllPostDetailsState();
}

class _AllPostDetailsState extends State<AllPostDetails> {
  List<UserPost> userPosts = [];
  bool isLoading = false;

  @override
  void initState() {
    getAllPost();
    super.initState();
  }

  void getAllPost() async {
    setState(() {
      isLoading = true;
    });
    userPosts = (await Apicalling().userPost(widget.id))!.toList();
    setState(() {
      isLoading = false;
    });
  }

  final Dio _dio = Dio();

  Future<String?> _postUserPost(String idUser) async {
    try {
      Response response = await _dio.post(
        "https://jsonplaceholder.typicode.com/posts",
        data: {
          "userId": idUser,
          // "id": "11",
          "title": "hhjdcbdjbjbkdgvcdjh",
          "body": "hgdjegkjedjkeudgjkevuigeugkufiye",
        },
      );

      if (response.statusCode == 201) {
        print("message sent");
        print(response.data);
        setState(() {});
      } else {
        print("error occured");
      }
    } catch (error) {
      print(error);
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POSTS"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              )
            : Stack(
                children: [
                  ListView.builder(
                    itemCount: userPosts.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CommentsPage(postUser: userPosts[index]),
                              ));
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
                          color: Colors.white,
                          elevation: 5,
                          shadowColor: Colors.teal.shade200,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 14),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                      flex: 2,
                                      child: Text(
                                        "USER ID",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Text(
                                        ":-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                          userPosts[index].userId.toString()),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.teal.shade100,
                                  thickness: 1,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                      flex: 2,
                                      child: Text(
                                        "ID",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Text(
                                        ":-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child:
                                          Text(userPosts[index].id.toString()),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.teal.shade100,
                                  thickness: 1,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                      flex: 2,
                                      child: Text(
                                        "TITLE",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Text(
                                        ":-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                          userPosts[index].title.toString()),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.teal.shade100,
                                  thickness: 1,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                      flex: 2,
                                      child: Text(
                                        "BODY",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Text(
                                        ":-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                          userPosts[index].body.toString()),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 15,
                    right: 15,
                    child: FloatingActionButton(
                      onPressed: () {
                        _postUserPost(widget.id);
                      },
                      child: Icon(Icons.add_box),
                      backgroundColor: Colors.teal,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
