import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../results/result.dart';
import 'create_model_event.dart';
part 'create_model_state.dart';

typedef UseCaseCallBack = Future<Result>? Function(dynamic data);

  class CreateModelBloc<Model> extends Bloc<CreateModelEvent, CreateModelState> {
    final UseCaseCallBack getData;
    CreateModelBloc(this.getData) : super(CreateModelInitial()) {
     on<CreateModelEvent>((event, emit) async {
      if (event is BaseCreateModelEvent) {
        emit(Loading());
        try {
          Result? response = await getData(event.requestData);
          if (response != null) {
            if (response.hasDataOnly) {
              emit(CreateModelSuccessfully(model: response.data));
            } else if (response.hasErrorOnly) {
              emit(Error(message:response.error??'', error: response.error));
            } else {
              emit(Error(message: 'some thing went wrong'));
            }
          } else {
            emit(CreateModelInitial());
          }
        } catch (e) {
          emit(Error(message: e.toString()));
        }
  }
     });
}}