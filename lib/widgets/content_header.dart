// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../models/models.dart';
import 'allWidgets.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({super.key, required this.featuredContent});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _ContentHeaderMobile(featuredContent: featuredContent),
    );
  }
}

class _ContentHeaderMobile extends StatefulWidget {
  final Content featuredContent;
  const _ContentHeaderMobile({required this.featuredContent});

  @override
  State<_ContentHeaderMobile> createState() => __ContentHeaderMobileState();
}

class __ContentHeaderMobileState extends State<_ContentHeaderMobile> {
  late VideoPlayerController _videoController;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.network(widget.featuredContent.videoUrl!)
          ..initialize().then((_) {
            setState(() {});
          })
          ..play();
    _videoController.setLooping(false);
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        _videoController.value.isPlaying
            ? _videoController.pause()
            : _videoController.play();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: _videoController.value.isInitialized
                ? size.width * 1.5 / size.height
                : 2.344,
            child: _videoController.value.isInitialized
                ? VideoPlayer(_videoController)
                : Container(
                    height: 500.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.featuredContent.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
          Container(
            height: size.height / 1.5,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 110.0,
            child: SizedBox(
              width: 250.0,
              child:
                  Image.asset(widget.featuredContent.titleImageUrl.toString()),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                  icon: Icons.add,
                  title: 'List',
                  onTapped: () => print('My List'),
                ),
                const _PlayButton(),
                VerticalIconButton(
                  icon: Icons.info_outline,
                  title: 'Info',
                  onTapped: () => print('Info'),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isMuted
                          ? _videoController.setVolume(100)
                          : _videoController.setVolume(0);
                      _isMuted = _videoController.value.volume == 0;
                    });
                  },
                  icon: Icon(
                    _isMuted ? Icons.volume_off : Icons.volume_up,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        print("Play");
      },
      icon: const Icon(
        Icons.play_arrow,
        color: Colors.black,
        size: 30.0,
      ),
      label: const Text(
        "Play",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
      ),
    );
  }
}
