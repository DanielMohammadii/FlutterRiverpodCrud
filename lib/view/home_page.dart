import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:r/provider/provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final val = ref.watch(numProvider);
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: val.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  IconButton(
                      onPressed: () {
                        ref.read(numProvider.notifier).updateFoo(
                              val[index],
                              Random().nextInt(100),
                            );
                      },
                      icon: Icon(Icons.update)),
                  Text('Number ${val[index]}'),
                  IconButton(
                      onPressed: () {
                        ref.read(numProvider.notifier).deleteFoo(val[index]);
                      },
                      icon: Icon(Icons.delete)),
                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (() {
            ref.read(numProvider.notifier).addFoo(Random().nextInt(100));
          })),
    );
  }
}
