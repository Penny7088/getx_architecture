import 'package:flutter/material.dart';

import 'complex.dart';

abstract class RenderStrategy {
  Widget build(BuildContext context);
}

// Banner策略
class BannerStrategy implements RenderStrategy {
  final List<String> _images = [
    'https://via.placeholder.com/600x300?text=Banner+1',
    'https://via.placeholder.com/600x300?text=Banner+2',
    'https://via.placeholder.com/600x300?text=Banner+3',
  ];

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Complex(),
    );
  }
}

// GridView策略
class GridViewStrategy implements RenderStrategy {
  final List<String> _items = List<String>.generate(20, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return Card(
          child: Center(
            child: Text(_items[index]),
          ),
        );
      },
    );
  }
}

// ListView策略
class ListViewStrategy implements RenderStrategy {
  final List<String> _items = List<String>.generate(20, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_items[index]),
        );
      },
    );
  }
}

class RenderContext {
  RenderStrategy _strategy;

  RenderContext(this._strategy);

  set strategy(RenderStrategy strategy) {
    _strategy = strategy;
  }

  Widget render(BuildContext context) {
    return _strategy.build(context);
  }
}

class StrategyFactory {
  static RenderStrategy createStrategy(int type) {
    switch (type) {
      case 1:
        return BannerStrategy();
      case 2:
        return GridViewStrategy();
      case 3:
        return ListViewStrategy();
      default:
        throw ArgumentError('Unknown strategy type');
    }
  }
}

