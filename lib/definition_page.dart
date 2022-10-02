import 'package:dictionary/definition.model.dart';
import 'package:dictionary/fetch_service.dart';
import 'package:dictionary/home_page.dart';
import 'package:flutter/material.dart';

class DefinitionPage extends StatefulWidget {
  const DefinitionPage({super.key});

  @override
  State<DefinitionPage> createState() => _DefinitionPageState();
}

var url = 'https://api.dictionaryapi.dev/api/v2/entries/en/$search';

class _DefinitionPageState extends State<DefinitionPage> {
  List<Definition> definitions = [];
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    getDef();
  }

  getDef() async {
    definitions = (await FetchService().getData())!;
    setState(() {
      isLoaded = true;
    });
  }

  var newSearch = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Row(
          children: [
            Container(
              width: 180,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                onChanged: (value) {
                  newSearch = value;
                },
                decoration: const InputDecoration(
                    hintText: 'Search more',
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none),
                cursorColor: Colors.black,
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    search = newSearch;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DefinitionPage(),
                      ),
                    );
                  });
                },
                child: const Text(
                  'Search',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        elevation: 0,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: definitions.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    definitions[index].word![0].toUpperCase() +
                        definitions[index].word!.substring(1).toString(),
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: 10,
                          bottom: 25,
                        ),
                        child: Text(
                          definitions[index].phonetics![0].text.toString(),
                          style: const TextStyle(),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.volume_up)))
                    ],
                  ),
                  Text(
                    'Definitions as a ${definitions[index].meanings![0].partOfSpeech}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  for (var i in definitions[index].meanings![0].definitions!)
                    Container(
                      padding:
                          const EdgeInsets.only(top: 15, left: 10, right: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            i.definition.toString(),
                            style: const TextStyle(color: Colors.black54),
                          ),
                          if (i.example != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(padding: EdgeInsets.only(top: 7)),
                                const Text('Phrase'),
                                Text(
                                  (i.example).toString(),
                                  style: const TextStyle(color: Colors.black54),
                                )
                              ],
                            ),
                          const Divider(
                            color: Colors.black87,
                          )
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
