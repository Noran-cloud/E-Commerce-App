part of 'comments_cubit.dart';

@immutable
sealed class CommentsState {}

final class CommentsInitial extends CommentsState {}

final class CommentsLoading extends CommentsState {}

final class CommentsLoaded extends CommentsState {
  final List<UserComments> userComments;
   CommentsLoaded(this.userComments);
}

final class CommentsError extends CommentsState {
  final String err_msg;
  CommentsError(this.err_msg);
}

