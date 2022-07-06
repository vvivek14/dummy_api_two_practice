import 'package:dummy_api_two_practice/database/serverFile.dart';
import 'package:dummy_api_two_practice/userData/userDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AllTodods extends StatefulWidget {
  final String userId;
  const AllTodods({Key? key, required this.userId}) : super(key: key);

  @override
  State<AllTodods> createState() => _AllTododsState();
}

class _AllTododsState extends State<AllTodods> {
  List<UserTodos> todosUser = [];

  bool completed = false;
  void _oncompletedChanged(bool newValue) => setState(() {
        completed = newValue;
      });
  bool isLoading = false;

  @override
  void initState() {
    getTodosAll();
    super.initState();
  }

  void getTodosAll() async {
    setState(() {
      isLoading = true;
    });
    todosUser = (await Apicalling().userTodos(widget.userId))!.toList();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODOS"),
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
                itemCount: todosUser.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    color: Colors.white,
                    elevation: 3,
                    shadowColor: Colors.teal.shade200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10),
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
                                  todosUser[index].id.toString(),
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
                                  todosUser[index].userId.toString(),
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
                                  todosUser[index].title.toString(),
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
                                value: todosUser[index].completed!,
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
              ),
      ),
    );
  }
}
