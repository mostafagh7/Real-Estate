part of 'create_model_bloc.dart';

abstract class CreateModelState {}
class CreateModelInitial extends CreateModelState {}
class Loading extends CreateModelState {}
class CreateModelSuccessfully extends CreateModelState {
  final dynamic model;
  CreateModelSuccessfully({this.model});
}
class Error extends CreateModelState {
  final String message;
  final String? error;
  Error({required this.message, this.error});
}