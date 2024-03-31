import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_task_3/data/stories/stories.dart';
import 'package:instagram_clone_task_3/widgets/post_widget.dart';
import 'package:instagram_clone_task_3/widgets/story_widget.dart';

class FeedScreen extends StatelessWidget {
  final List<Post> posts;
  FeedScreen({super.key, required this.posts});
  final stories = Stories().stories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          pinned: true,
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
        SliverToBoxAdapter(
          child: SizedBox(
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
        ),
        const SliverToBoxAdapter(
          child: Divider(
            thickness: 0.1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final post = posts[index];
            return Post(postImage: post.postImage, text: post.text);
          }, childCount: posts.length),
        ),
      ]),
    );
  }
}
