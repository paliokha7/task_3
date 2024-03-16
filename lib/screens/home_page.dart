import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_task_3/data/posts/posts.dart';
import 'package:instagram_clone_task_3/data/stories/stories.dart';
import 'package:instagram_clone_task_3/theme/app_colors.dart';
import 'package:instagram_clone_task_3/widgets/post_widget.dart';
import 'package:instagram_clone_task_3/widgets/story_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final stories = Stories().stories;
  final posts = Posts().posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 60,
        surfaceTintColor: Colors.transparent,
        title: SvgPicture.asset(
          'assets/ic_instagram.svg',
          height: 35,
          width: 130,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/like.svg',
              height: 25,
              width: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/direct.svg',
              height: 25,
              width: 2,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 115,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  final story = stories[index];
                  return Row(
                    children: [
                      Story(image: story.image, name: story.name),
                    ],
                  );
                },
              ),
            ),
            const Divider(
              thickness: 0.1,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: posts.length,
              itemBuilder: ((context, index) {
                final post = posts[index];
                return Post(
                  username: post.username,
                  profilePicture: post.profilePicture,
                  postImage: post.postImage,
                  likes: post.likes,
                  text: post.text,
                  date: post.date,
                  views: post.views,
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        activeColor: AppColors.textPrimary,
        backgroundColor: AppColors.background,
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
              child: SvgPicture.asset('assets/search.svg'),
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
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset('assets/reels.svg'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset('assets/user.svg'),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
