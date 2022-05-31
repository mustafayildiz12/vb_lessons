import 'package:dio_servis_learn_202/models/comment_model.dart';
import 'package:dio_servis_learn_202/service_202/dio_service.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  CommentPage({required this.id, Key? key}) : super(key: key);

  int id;

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  late final IDioService service;
  bool _isLoading = false;

  List<CommentModel>? commentItems;

  @override
  void initState() {
    super.initState();
    service = DioService();
    fetchComments(12);
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  fetchComments(int id) async {
    _changeLoading();
    commentItems = await service.getComments(id);
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: commentItems?.length ?? 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(commentItems?[index].name ?? 'Cannot get emails')),
          );
        },
      ),
    );
  }
}
