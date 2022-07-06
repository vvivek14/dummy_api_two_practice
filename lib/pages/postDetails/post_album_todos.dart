import 'package:dummy_api_two_practice/database/serverFile.dart';
import 'package:dummy_api_two_practice/pages/album/albumPage.dart';
import 'package:dummy_api_two_practice/pages/allTodos.dart';
import 'package:dummy_api_two_practice/pages/postDetails/allPostDetails.dart';
import 'package:dummy_api_two_practice/userData/userDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/material.dart';

class UserPosts extends StatefulWidget {
  final String id;

  const UserPosts({Key? key, required this.id}) : super(key: key);

  @override
  State<UserPosts> createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  List<UserPost> _post = [];
  List<UserAlbum> _album = [];
  List<UserTodos> _todos = [];

  bool isLoading = false;
  bool completed = false;
  void _oncompletedChanged(bool newValue) => setState(() {
        completed = newValue;
      });

  @override
  void initState() {
    getPost();
    super.initState();
  }

  void getPost() async {
    setState(() {
      isLoading = true;
    });
    _post = (await Apicalling().userPost(widget.id))!.take(3).toList();
    _album = (await Apicalling().userAlbum(widget.id))!.take(3).toList();
    _todos = (await Apicalling().userTodos(widget.id))!.take(3).toList();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("User Post"),
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
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 1,
                                color: Colors.black38.withOpacity(.3),
                              ),
                            ],
                          ),
                          child: post(),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 1,
                                color: Colors.black38.withOpacity(.3),
                              ),
                            ],
                          ),
                          child: album(),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 1,
                                color: Colors.black38.withOpacity(.3),
                              ),
                            ],
                          ),
                          child: todos(),
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }

  Widget post() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "POSTS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CupertinoButton(
                  color: Colors.teal.shade400,
                  padding: const EdgeInsets.all(6),
                  borderRadius: BorderRadius.circular(6),
                  child: const Text("View All"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllPostDetails(id: widget.id),
                      ),
                    );
                  }),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _post.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              color: Colors.white,
              elevation: 5,
              shadowColor: Colors.teal.shade200,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            "ID",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Text(
                            ":-",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            _post[index].id.toString(),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.teal.shade100,
                      endIndent: 5,
                      indent: 5,
                      thickness: 1,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            "TITLE",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Text(
                            ":-",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            _post[index].title.toString(),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.teal.shade100,
                      endIndent: 5,
                      indent: 5,
                      thickness: 1,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            "BODY",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Text(
                            ":-",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            _post[index].body.toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }

  Widget album() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "ALBUM",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CupertinoButton(
                  color: Colors.teal.shade400,
                  padding: const EdgeInsets.all(6),
                  borderRadius: BorderRadius.circular(6),
                  child: const Text("View All"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AlbumPageAll(id: widget.id)));
                  }),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _album.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              color: Colors.white,
              elevation: 5,
              shadowColor: Colors.teal.shade200,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            "ID",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Text(
                            ":-",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            _album[index].id.toString(),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.teal.shade100,
                      endIndent: 5,
                      indent: 5,
                      thickness: 1,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            "USER ID",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Text(
                            ":-",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            _album[index].userId.toString(),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.teal.shade100,
                      endIndent: 5,
                      indent: 5,
                      thickness: 1,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            "TITLE",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Text(
                            ":-",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            _album[index].title.toString(),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }

  Widget todos() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "TODOS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CupertinoButton(
                  color: Colors.teal.shade400,
                  padding: const EdgeInsets.all(6),
                  borderRadius: BorderRadius.circular(6),
                  child: const Text("View All"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AllTodods(userId: widget.id)));
                  }),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _todos.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              color: Colors.white,
              elevation: 5,
              shadowColor: Colors.teal.shade200,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            "ID",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Text(
                            ":-",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            _todos[index].id.toString(),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.teal.shade100,
                      endIndent: 5,
                      indent: 5,
                      thickness: 1,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            "USER ID",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Text(
                            ":-",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            _todos[index].userId.toString(),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.teal.shade100,
                      endIndent: 5,
                      indent: 5,
                      thickness: 1,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            "TITLE",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Text(
                            ":-",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            _todos[index].title.toString(),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.teal.shade100,
                      endIndent: 5,
                      indent: 5,
                      thickness: 1,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            "COMPLETED",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        FlutterSwitch(
                          width: 60,
                          height: 30,
                          activeColor: Colors.teal.withOpacity(.7),
                          value: _todos[index].completed!,
                          onToggle: (val) {
                            setState(() {
                              completed = val;
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
