import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_controller.dart';

class NewView extends GetView<NewController> {
  const NewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
