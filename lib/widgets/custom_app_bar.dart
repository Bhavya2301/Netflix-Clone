import 'package:flutter/material.dart';
import 'package:netflix_clone/assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrolloffSet;
  const CustomAppBar({super.key, this.scrolloffSet = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color: Colors.black
          .withOpacity((scrolloffSet / 350).clamp(0, 0.65).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            const SizedBox(width: 12.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _AppBarButton(
                    onTap: () {},
                    title: "TV Shows",
                  ),
                  _AppBarButton(
                    onTap: () {},
                    title: "Movies",
                  ),
                  _AppBarButton(
                    onTap: () {},
                    title: "My List",
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const _AppBarButton({required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
