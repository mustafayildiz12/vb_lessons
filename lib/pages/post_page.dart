import 'package:dio_servis_learn_202/models/post_model.dart';
import 'package:dio_servis_learn_202/pages/comment_page.dart';
import 'package:flutter/material.dart';

import '../service_202/dio_service.dart';
import '../widgets/password_field.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late final IDioService service;
  bool _isLoading = false;

  List<PostModel>? postItems;

  @override
  void initState() {
    super.initState();
    service = DioService();
    fetchItems();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  fetchItems() async {
    _changeLoading();
    postItems = await service.getPost();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.abc),
      ),
      appBar: AppBar(
        title: Text("AppBar"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const PasswordField(),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 12),
              child: ListView.builder(
                  itemCount: postItems?.length ?? 2,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  CommentPage(id: postItems![index].id!),
                            ),
                          );
                        },
                        child: Text('${postItems?[index].id}'),
                      ),
                      title: Text(
                        postItems?[index].title ?? 'Can not get title',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        postItems?[index].body ?? 'Can not get body',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
