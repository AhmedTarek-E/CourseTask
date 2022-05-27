import 'package:flutter/material.dart';
import 'package:inovola_task/utils/common.dart';
import 'package:inovola_task/utils/dimensions.dart';
import 'package:inovola_task/utils/image_preview/app_network_image.dart';
import 'package:inovola_task/utils/image_preview/image_preview_page.dart';

class ImagesCarousel extends StatefulWidget {
  final List<String> images;
  const ImagesCarousel({Key? key, required this.images}) : super(key: key);

  @override
  State<ImagesCarousel> createState() => _ImagesCarouselState();
}

class _ImagesCarouselState extends State<ImagesCarousel>
    with TickerProviderStateMixin {

  late final TabController controller = TabController(length: 4, vsync: this);


  void _onPageChanged(int position) {
    setState(() {
      controller.index = position;
    });
  }

  void _onImagePressed(String image) {
    pushMaterialPage(context, ImagePreviewPage.network(image));
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        PageView.builder(
          onPageChanged: _onPageChanged,
          physics: const ClampingScrollPhysics(),
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _onImagePressed(widget.images[index]),
              child: AspectRatio(
                aspectRatio: 1.6,
                child: AppNetworkImage(
                  image: widget.images[index],
                  fit: BoxFit.cover,
                  placeholderColor: Colors.transparent,
                ),
              ),
            );
          },
        ),

        IgnorePointer(
          ignoring: true,
          child: Opacity(
            opacity: 0.3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
          ),
        ),

        PositionedDirectional(
          bottom: 8,
          end: 16,
          child: TabPageSelector(
            controller: controller,
            indicatorSize: 8,
            color: Colors.grey,
            selectedColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
