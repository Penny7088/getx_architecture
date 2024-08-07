import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';


class Complex extends StatefulWidget {
  const Complex({super.key});

  @override
  State<Complex> createState() => _ComplexState();
}

class _ComplexState extends State<Complex> {
  double _anchor = 0.0;
  bool _center = true;
  double _velocityFactor = 0.2;
  final double _itemExtent = 120;
  late InfiniteScrollController _controller;
  List<String> kDemoImages = [
    'https://i.pinimg.com/originals/7f/91/a1/7f91a18bcfbc35570c82063da8575be8.jpg',
    'https://www.absolutearts.com/portfolio3/a/afifaridasiddique/Still_Life-1545967888l.jpg',
    'https://cdn11.bigcommerce.com/s-x49po/images/stencil/1280x1280/products/53415/72138/1597120261997_IMG_20200811_095922__49127.1597493165.jpg?c=2',
    'https://i.pinimg.com/originals/47/7e/15/477e155db1f8f981c4abb6b2f0092836.jpg',
    'https://images.saatchiart.com/saatchi/770124/art/3760260/2830144-QFPTZRUH-7.jpg',
    'https://images.unsplash.com/photo-1471943311424-646960669fbc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c3RpbGwlMjBsaWZlfGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80',
    'https://cdn11.bigcommerce.com/s-x49po/images/stencil/1280x1280/products/40895/55777/1526876829723_P211_24X36__2018_Stilllife_15000_20090__91926.1563511650.jpg?c=2',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIUsxpakPiqVF4W_rOlq6eoLYboOFoxw45qw&usqp=CAU',
    'https://images.mojarto.com/photos/267893/large/DA-SL-01.jpg?1560834975',
  ];
  @override
  void initState() {
    super.initState();
    _controller = InfiniteScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complex Example')),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: InfiniteCarousel.builder(
                itemCount: kDemoImages.length,
                itemExtent: _itemExtent,
                center: _center,
                anchor: _anchor,
                velocityFactor: _velocityFactor,
                scrollBehavior: kIsWeb
                    ? ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    // Allows to swipe in web browsers
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse
                  },
                )
                    : null,
                controller: _controller,
                itemBuilder: (context, itemIndex, realIndex) {
                  final currentOffset = _itemExtent * realIndex;
                  return AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      final diff = (_controller.offset - currentOffset);
                      const maxPadding = 10.0;
                      final carouselRatio = _itemExtent / maxPadding;

                      return Padding(
                        padding: EdgeInsets.only(
                          top: (diff / carouselRatio).abs(),
                          bottom: (diff / carouselRatio).abs(),
                        ),
                        child: child,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: kElevationToShadow[2],
                          image: DecorationImage(
                            image: NetworkImage(kDemoImages[itemIndex]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('Center selected element'),
              value: _center,
              onChanged: (newValue) {
                setState(() {
                  _center = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            if (!_center) ...[
              Text('Selected Item Anchor: ${_anchor.toStringAsFixed(2)}'),
              Slider(
                min: 0.0,
                max: 1.0,
                value: _anchor,
                onChanged: (value) {
                  setState(() {
                    _anchor = value;
                  });
                },
              ),
            ],
            const SizedBox(height: 20),
            Text('Velocity Factor: ${_velocityFactor.toStringAsFixed(2)}'),
            Slider(
              min: 0.1,
              max: 1.0,
              value: _velocityFactor,
              onChanged: (value) {
                setState(() {
                  _velocityFactor = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}