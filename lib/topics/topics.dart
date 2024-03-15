import 'package:flutter/material.dart';
import 'package:myapp/services/firestore.dart';
import 'package:myapp/services/models.dart';
import 'package:myapp/shared/bottom_navigation.dart';
import 'package:myapp/shared/error.dart';
import 'package:myapp/shared/loading.dart';
import 'package:myapp/topics/drawer.dart';
import 'package:myapp/topics/topic_item.dart';

class Topics extends StatelessWidget {
  const Topics({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: FirestoreService().getTopics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: ErrorMessage(
              message: snapshot.error.toString(),
            ),
          );
        } else if (snapshot.hasData) {
          var topics = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Topics'),
              backgroundColor: Colors.deepPurple,
            ),
            drawer: TopicDrawer(topics: topics),
            body: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              children: topics
                  .map((e) => TopicItem(
                        topic: e,
                      ))
                  .toList(),
            ),
            bottomNavigationBar: const BottomNavBar(),
          );
        } else {
          return const Text('No topics found, check DB!');
        }
      },
    );
  }
}
