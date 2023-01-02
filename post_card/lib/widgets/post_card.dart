import 'package:flutter/material.dart';
import 'package:post_card/widgets/card_icon.dart';

import '../constants.dart';
import '../model/post.dart';
import 'clipper.dart';
import 'gradient_round_border.dart';

class PostCard extends StatefulWidget {
  final PostModel post;
  const PostCard({
    super.key,
    required this.post,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate)
        .drive(Tween<double>(begin: 75, end: 300));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return GestureDetector(
          onTap: () {
            _controller.isCompleted ? _controller.reverse() : _controller.forward();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 3.5, horizontal: 10),
            height: _animation.value,
            decoration: BoxDecoration(
              gradient: greyGradient,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: GradientBorder(
                    child: Image.asset(
                      widget.post.profilePicture,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    widget.post.author,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: patrickHand,
                    ),
                  ),
                  subtitle: Text(
                    widget.post.timeAgo,
                    style: const TextStyle(fontSize: 10),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_animation.value <= 150) ...[
                        const CardIcon(Icons.mode_comment_rounded),
                        const CardIcon(Icons.favorite_rounded),
                      ],
                      const CardIcon(Icons.bookmark_rounded),
                    ],
                  ),
                ),
                if (_animation.value >= 150)
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipPath(
                          clipper: ContainerClipper(),
                          child: Container(
                            width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                              gradient: greyGradient,
                              image: DecorationImage(
                                  image: AssetImage(widget.post.postPicture), fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              CardIcon(Icons.mode_comment_rounded),
                              CardIcon(Icons.favorite_rounded),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
