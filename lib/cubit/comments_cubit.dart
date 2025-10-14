import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rwad2/Services/user_service.dart';
import 'package:rwad2/models/userComments.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final UserService userService;
  CommentsCubit(this.userService) : super(CommentsInitial());

  Future<void> fetch_comments() async{
    emit(CommentsLoading());
    try{
      final comments = await userService.getComments();
      emit(CommentsLoaded(comments));
    }
    catch(e){
      emit(CommentsError(e.toString()));
    }
  }
}
