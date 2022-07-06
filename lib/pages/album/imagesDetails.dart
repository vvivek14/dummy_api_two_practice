import 'package:dummy_api_two_practice/database/serverFile.dart';
import 'package:dummy_api_two_practice/userData/userDetails.dart';
import 'package:flutter/material.dart';

class ImageDetails extends StatefulWidget {
  final String id;
  const ImageDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<ImageDetails> createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails> {
  UserImages? _userImages;

  bool isLoading = false;

  @override
  void initState() {
    getImagesView();
    super.initState();
  }

  void getImagesView() async {
    setState(() {
      isLoading = true;
    });
    _userImages = await Apicalling().imageUserView(widget.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_userImages?.title.toString() ?? ""),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: Card(
                  // margin:
                  //     const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  color: Colors.white,
                  elevation: 5,
                  shadowColor: Colors.teal.shade200,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        child: Image.network("${_userImages?.url}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, top: 10),
                        child: Row(
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
                              child: Text(_userImages!.id.toString()),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.teal.shade100,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              flex: 2,
                              child: Text(
                                "ALBUM ID",
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
                              child: Text(_userImages!.albumId.toString()),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.teal.shade100,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, bottom: 10),
                        child: Row(
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
                              child: Text(_userImages!.title.toString()),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
