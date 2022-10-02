import 'package:dictionary/definition_page.dart';
import 'package:flutter/material.dart';

// TextEditingController search = TextEditingController();
String search = '';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var style = const TextStyle(
      fontFamily: 'italianno',
      fontSize: 50,
      color: Colors.black,
      fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 225, 247),
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 250,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(100),
          ),
        ),
        title: Center(
          child: Column(children: const [
            Text(
              'Ask Me About Any Word',
              style: TextStyle(
                fontFamily: 'italianno',
                fontSize: 45,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            // Text('Word', style: style)
          ]),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: const Color(0xffb1b2ff),
          ),
          Container(
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 224, 225, 247),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: (value) {
                      search = value;
                    },
                    decoration: const InputDecoration(
                        hintText: 'Search here',
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        border: InputBorder.none),
                    cursorColor: Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint(search);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DefinitionPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7), // <-- Radius
                      ),
                      elevation: 0.0,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      textStyle: const TextStyle(color: Colors.black),
                      backgroundColor: const Color(0xffb1b2ff),
                    ),
                    child: const Text(
                      'Search',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
