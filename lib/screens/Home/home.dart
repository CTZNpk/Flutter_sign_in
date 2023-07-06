import 'package:flutter/material.dart';
import 'package:sign_in/services/auth_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final _auth = AuthService();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: myTheme.colorScheme.primary,
              expandedHeight: 50,
              toolbarHeight: 50,
              elevation: 0.0,
              title: Text(
                'PlaceHolder',
                style: myTheme.textTheme.titleLarge
                    ?.copyWith(color: myTheme.colorScheme.onSurface),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt_outlined),
                  color: myTheme.colorScheme.onSurface,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: myTheme.colorScheme.onSurface,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                  color: myTheme.colorScheme.onSurface,
                ),
              ],
              bottom: TabBar(
                  indicatorColor: Colors.blue[300],
                  tabs: const [
                    Tab(
                      text: 'Chats',
                    ),
                    Tab(
                      text: 'Status',
                    ),
                    Tab(
                      text: 'Calls',
                    ),
                  ]),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final bgcolor = index % 2 == 0
                      ? myTheme.colorScheme.onSurface
                      : myTheme.colorScheme.background;
                  return Container(
                    height: 100,
                    color: bgcolor,
                    child: Center(
                      child: Text(
                        '$index',
                        textScaleFactor: 5,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async {
          _auth.signingOut();
        }),
      ),
    );
  }
}
