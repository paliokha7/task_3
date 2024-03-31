import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_task_3/theme/app_colors.dart';

class Post extends StatefulWidget {
  final File? postImage;
  final String text;

  const Post({
    super.key,
    required this.postImage,
    required this.text,
  });

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool isLiked = false;

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
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Emma",
                      style: TextStyle(fontWeight: FontWeight.bold),
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
            child: Image.file(
              widget.postImage!,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? AppColors.red : AppColors.textPrimary,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/comment-icon.svg',
                  height: 25,
                  width: 25,
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
                const Text(
                  '121 Likes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Emma",
                        style: TextStyle(
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
                        text: widget.text,
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
                const Text(
                  'View 12 Comments ',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '3 days ago',
                  style: TextStyle(color: AppColors.textSecondary),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
