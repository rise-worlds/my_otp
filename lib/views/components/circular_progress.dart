
import 'package:flutter/material.dart';

class CircularProgress extends StatefulWidget {
  const CircularProgress({super.key});

  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          width: 50,
          height: 50,
          duration: const Duration(seconds: 1),
          child: const CircularProgressIndicator(
            strokeWidth: 5, //设置进度条的宽
            color: Colors.red, //设置进度条颜色
            backgroundColor: Colors.grey, //设置进度条背景颜色
          ),
        ), //圆形进度指示器
      ),
    );
  }
}