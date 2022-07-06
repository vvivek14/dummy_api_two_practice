import 'package:dummy_api_two_practice/database/serverFile.dart';
import 'package:dummy_api_two_practice/pages/album/images.dart';
import 'package:dummy_api_two_practice/userData/userDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlbumPageAll extends StatefulWidget {
  final String id;
  const AlbumPageAll({Key? key, required this.id}) : super(key: key);

  @override
  State<AlbumPageAll> createState() => _AlbumPageAllState();
}

class _AlbumPageAllState extends State<AlbumPageAll> {
  List<UserAlbum> albumUser = [];
  bool isLoading = false;
  @override
  void initState() {
    getAlbumUser();
    super.initState();
  }

  void getAlbumUser() async {
    setState(() {
      isLoading = true;
    });
    albumUser = (await Apicalling().userAlbum(widget.id))!.toList();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album"),
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
            : ListView.builder(
                itemCount: albumUser.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageAlbum(
                                  id: albumUser[index].id.toString())));
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    ":-",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child:
                                      Text(albumUser[index].userId.toString()),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    ":-",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text(albumUser[index].id.toString()),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    ":-",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child:
                                      Text(albumUser[index].title.toString()),
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
      ),
    );
  }
}
