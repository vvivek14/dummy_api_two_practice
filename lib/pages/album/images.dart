import 'package:dummy_api_two_practice/database/serverFile.dart';
import 'package:dummy_api_two_practice/pages/album/imagesDetails.dart';
import 'package:dummy_api_two_practice/userData/userDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageAlbum extends StatefulWidget {
  final String id;
  const ImageAlbum({Key? key, required this.id}) : super(key: key);

  @override
  State<ImageAlbum> createState() => _ImageAlbumState();
}

class _ImageAlbumState extends State<ImageAlbum> {
  List<UserImages> imageUser = [];

  bool isLoading = false;

  @override
  void initState() {
    getImages();
    super.initState();
  }

  void getImages() async {
    setState(() {
      isLoading = true;
    });
    imageUser = (await Apicalling().userImages(widget.id))!;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Images"),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              )
            : GridView.builder(
                itemCount: imageUser.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.4),
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageDetails(
                                  id: imageUser[index].id.toString()),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 1,
                                color: Colors.black12,
                              )
                            ]),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Image.network(
                              imageUser[index].thumbnailUrl.toString(),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 5),
                              child: Row(
                                children: [
                                  const Expanded(
                                    flex: 4,
                                    child: Text(
                                      "Id",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                    flex: 4,
                                    child: Text(
                                      imageUser[index].id.toString(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              indent: 10,
                              endIndent: 10,
                              height: 10,
                              color: Colors.teal.shade100,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: Row(
                                children: [
                                  const Expanded(
                                    flex: 4,
                                    child: Text(
                                      "ALBUM ID",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                    flex: 4,
                                    child: Text(
                                      imageUser[index].albumId.toString(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              indent: 10,
                              endIndent: 10,
                              height: 10,
                              color: Colors.teal.shade100,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Expanded(
                                    flex: 4,
                                    child: Text(
                                      "TITLE",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                    flex: 4,
                                    child: Text(
                                      imageUser[index].title.toString(),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
      ),
    );
  }
}
