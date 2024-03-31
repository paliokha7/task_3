import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_task_3/screens/add_post.dart';
import 'package:instagram_clone_task_3/screens/feed_screen.dart';
import 'package:instagram_clone_task_3/theme/app_colors.dart';
import 'package:instagram_clone_task_3/widgets/post_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePgeState();
}

class _HomePgeState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  final List<Post> _posts = [];

  void addPost(Post post) {
    setState(() {
      _posts.add(post);
    });
  }

  List<Widget> tabs = [];

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabs = [
      FeedScreen(posts: _posts),
      AddPostScreen(onPostAdded: addPost),
    ];
    tabController = TabController(length: tabs.length, vsync: this);

    tabController.addListener(
      () {
        setState(
          () {
            currentIndex = tabController.index;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: tabs,
      ),
      bottomNavigationBar: CupertinoTabBar(
        activeColor: AppColors.textPrimary,
        backgroundColor: AppColors.background,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            tabController.index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset('assets/home.svg'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset('assets/add.svg'),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
