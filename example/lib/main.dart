import 'package:flutter/material.dart';
import 'package:jdraggable_view/jdraggable_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JDraggable View',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return JDraggableView(
      leading: const Icon(Icons.arrow_back_ios),
      title: const Text("Collapsed View"),
      actions: [
        IconButton(onPressed: () {
          scrollController.animateTo(scrollController.position.minScrollExtent - 200, duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }, icon: const Icon(Icons.arrow_downward_sharp)),
      ],
      expandedHeader: Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            "Expanded View",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Colors.white70),
          ),
        ),
      ),
      controller: scrollController,
      expandedHeaderBottomBar:  Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: () {
            scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.ease);
          }, icon: const Icon(Icons.arrow_upward)),
        ],
      ),
      body: [
        for(int i = 0; i<20; i++)
          Card(
            color: Colors.white70,
            child: ListTile(
              leading: CircleAvatar(
                child: Text("$i"),
              ),
              title: const Text("Title"),
              subtitle: const Text("Details"),
            ),
          )
      ],
      headerExpandedHeight: 0.2,
      fullyStretchable: true,
      stretchMaxHeight: 0.3,
      onRefresh: ()async{
        await Future.delayed(const Duration(milliseconds: 1500));
      },
      // expandedBody: RefreshIndicator(child: child, onRefresh: onRefresh),
      expandedBody: Stack(
        children: [
          Container(color: Colors.black),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Stack(
                children: [
                  Positioned(
                      top: 20,
                      right: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(.5),
                            child: const Icon(
                              Icons.ac_unit,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )),
                  Positioned(
                    bottom: 50,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              color: Colors.grey[300],
                              height: 100,
                              width: 100,
                              alignment: Alignment.center,
                              child: const CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      appBarColor: Colors.teal,
    );
  }
}