import 'package:dummy_api_two_practice/userData/userDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatelessWidget {
  final AllUsers objectData;
  const ProfilePage({Key? key, required this.objectData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Profile"),
          centerTitle: true,
          backgroundColor: Colors.teal),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  // margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  color: Colors.white,
                  elevation: 5,
                  shadowColor: Colors.blue.shade200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID:- ${objectData.id.toString()}"),
                        SizedBox(height: 5),
                        Text("NAME:- ${objectData.name.toString()}"),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 8),
                  child: Text(
                    "Profile Details :-",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Card(
                  // margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  color: Colors.white,
                  elevation: 5,
                  shadowColor: Colors.blue.shade200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              flex: 3,
                              child: Text(
                                "ID",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                ":-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                objectData.id.toString(),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Divider(
                          thickness: 1,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              flex: 3,
                              child: Text(
                                "NAME",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                ":-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                objectData.name.toString(),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Divider(
                          thickness: 1,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              flex: 3,
                              child: Text(
                                "USER NAME",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                ":-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                objectData.username.toString(),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Divider(
                          thickness: 1,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              flex: 3,
                              child: Text(
                                "PHONE NO.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                ":-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                objectData.phone.toString(),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Divider(
                          thickness: 1,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              flex: 3,
                              child: Text(
                                "ADDRESS",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                ":-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "CITY :- ${objectData.address!.city.toString()}",
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "STREET :- ${objectData.address!.street.toString()}",
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "SUITE :- ${objectData.address!.suite.toString()}",
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Divider(
                          thickness: 1,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              flex: 3,
                              child: Text(
                                "COMPANY",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                ":-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "NAME :- ${objectData.company!.name.toString()}",
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.clip,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "CATCH PHRASE :- ${objectData.company!.catchPhrase.toString()}",
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.clip,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "BS :- ${objectData.company!.bs.toString()}",
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Divider(
                          thickness: 1,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              flex: 3,
                              child: Text(
                                "WEBSITE",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                ":-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                objectData.website.toString(),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(height: 5),
                        // const Divider(
                        //   thickness: 1,
                        // ),
                      ],
                    ),
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
