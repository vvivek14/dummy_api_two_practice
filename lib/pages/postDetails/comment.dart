import 'package:dio/dio.dart';
import 'package:dummy_api_two_practice/database/serverFile.dart';
import 'package:dummy_api_two_practice/pages/postDetails/post_album_todos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../userData/userDetails.dart';

class CommentsPage extends StatefulWidget {
  final UserPost postUser;
  const CommentsPage({Key? key, required this.postUser}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  List<UserComments> commentUser = [];

  bool isLoading = false;

  @override
  void initState() {
    getComments();
    super.initState();
  }

  void getComments() async {
    setState(() {
      isLoading = true;
    });
    commentUser = (await Apicalling().userComments(widget.postUser.id))!;
    setState(() {
      isLoading = false;
    });
  }

  final Dio _dio = Dio();

  Future<String?> _postUserDelet(String idUser) async {
    try {
      Response response = await _dio.delete(
        "https://jsonplaceholder.typicode.com/comments/$idUser",
        // data: {
        //   "userId": idUser,
        //   // "id": "11",
        //   "title": "hhjdcbdjbjbkdgvcdjh",
        //   "body": "hgdjegkjedjkeudgjkevuigeugkufiye",
        // },
      );

      if (response.statusCode == 200) {
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
        title: Text("Comments"),
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
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          // margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          color: Colors.white,
                          elevation: 5,
                          shadowColor: Colors.teal.shade200,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                      flex: 2,
                                      child: Text(
                                        "ID",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Text(
                                        ":-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                        widget.postUser.id.toString(),
                                        style: TextStyle(fontSize: 16),
                                      ),
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
                                        "USER ID",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Text(
                                        ":-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                        widget.postUser.userId.toString(),
                                        style: TextStyle(fontSize: 16),
                                      ),
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
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Text(
                                        ":-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                        widget.postUser.title.toString(),
                                        style: const TextStyle(fontSize: 16),
                                      ),
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
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Text(
                                        ":-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                        widget.postUser.body.toString(),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            "COMMENTS :- ",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: commentUser.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _postUserDelet(
                                      commentUser[index].id.toString());
                                });
                              },
                              child: Card(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                color: Colors.white,
                                elevation: 2,
                                shadowColor: Colors.teal.shade200,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 8),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            child: Text(
                                              commentUser[index].id.toString(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.teal.shade100,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Expanded(
                                            flex: 2,
                                            child: Text(
                                              "POST Id",
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
                                              commentUser[index]
                                                  .postId
                                                  .toString(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.teal.shade100,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Expanded(
                                            flex: 2,
                                            child: Text(
                                              "NAME",
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
                                              commentUser[index]
                                                  .name
                                                  .toString(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.teal.shade100,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Expanded(
                                            flex: 2,
                                            child: Text(
                                              "Email",
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
                                              commentUser[index]
                                                  .email
                                                  .toString(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.teal.shade100,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              commentUser[index]
                                                  .body
                                                  .toString(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                )),
    );
  }
}
