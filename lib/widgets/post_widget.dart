import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_task_3/theme/app_colors.dart';

class Post extends StatelessWidget {
  final String username;
  final String profilePicture;
  final String postImage;
  final int likes;
  final String text;
  final int date;
  final int views;

  const Post(
      {super.key,
      required this.username,
      required this.profilePicture,
      required this.postImage,
      required this.likes,
      required this.text,
      required this.date,
      required this.views});

  @override
  Widget build(BuildContext context) {
    final photoSize = MediaQuery.of(context).size.height * 0.35;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        profilePicture,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      username,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  'assets/more.svg',
                  height: 25,
                  width: 25,
                )
              ],
            ),
          ),
          SizedBox(
            height: photoSize,
            width: double.infinity,
            child: Image.network(
              postImage,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                  'assets/comment.svg',
                  height: 30,
                  width: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/shareicon.svg',
                  height: 30,
                  width: 30,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/save.svg',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$likes Likes',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(
                          width: 5,
                        ),
                      ),
                      TextSpan(
                        text: text,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'View $views Comments ',
                  style: const TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '$date days ago',
                  style: const TextStyle(color: AppColors.textSecondary),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
