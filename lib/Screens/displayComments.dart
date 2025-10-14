import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwad2/DI/di.dart';
import 'package:rwad2/Services/user_service.dart';
import 'package:rwad2/cubit/comments_cubit.dart';
import 'package:rwad2/models/userComments.dart';

class Displaycomments extends StatefulWidget {
  const Displaycomments({super.key});

  @override
  State<Displaycomments> createState() => _DisplaycommentsState();
}

class _DisplaycommentsState extends State<Displaycomments> {
   final userService = locator<UserService>();
  
  List<UserComments> comments = [];
  bool isLoading = true;

  void getUserCommentsFromServer() async {
    comments = await userService.getComments();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserCommentsFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Comments")),
      body: BlocBuilder<CommentsCubit, CommentsState>(
        builder: (context, state) {
          return isLoading
          ? const Center(child: CircularProgressIndicator())
          : comments.isEmpty
              ? const Center(child: Text("No comments found"))
              : ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final comment = comments[index];
                    return ListTile(
                      leading:  Text('${comment.id}'),
                      title: Text('${comment.name}'),
                      subtitle: Text('${comment.body}'),
                    );
                  },
                );
        },
      ),
      // 
    );
  }
}
