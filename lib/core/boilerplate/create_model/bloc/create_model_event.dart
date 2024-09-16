
abstract class CreateModelEvent {}

class BaseCreateModelEvent extends CreateModelEvent {
  dynamic requestData;
  BaseCreateModelEvent({this.requestData});
}