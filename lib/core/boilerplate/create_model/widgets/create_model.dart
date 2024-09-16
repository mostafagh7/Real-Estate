import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../ui/dialogs/dialogs.dart';
import '../bloc/create_model_bloc.dart';
import '../bloc/create_model_event.dart';

typedef CreatedCallback = void Function(CreateModelBloc bloc);
typedef ModelCreated<Model> = Function(Model model);

class CreateModel<Model> extends StatefulWidget {
  final ModelCreated<Model>? onSuccess;
  final double? loadingHeight;
  final UseCaseCallBack? useCaseCallBack;
  final CreatedCallback? onCubitCreated;
  final Widget child;
  final Function? onTap;
  final bool withValidation;
  final Function? onError;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  const CreateModel({
    super.key,
    this.useCaseCallBack,
    this.onTap,
    this.onCubitCreated,
    required this.child,
    this.onSuccess,
    required this.withValidation,
    this.loadingHeight,
    this.onError,
    this.loadingWidget,
    this.errorWidget,
  });

  @override
  State<CreateModel<Model>> createState() => _GetModelState<Model>();
}

class _GetModelState<Model> extends State<CreateModel<Model>> {
  CreateModelBloc<Model>? bloc;

  @override
  void initState() {
    bloc = CreateModelBloc<Model>(widget.useCaseCallBack!);
    if (widget.onCubitCreated != null) {
      widget.onCubitCreated!(bloc!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateModelBloc, CreateModelState>(
        bloc: bloc,
        builder: (context, state) {
          if (widget.onCubitCreated != null) {
            widget.onCubitCreated!(bloc!);
          }
          if (state is Loading) {
            return widget.loadingWidget ??
                SizedBox(height: widget.loadingHeight ?? 50, child: const Center(child:  Padding(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      child: CupertinoActivityIndicator())));
          } else {
            return InkWell(
                onTap: () {
                  if (widget.withValidation) {
                    var temp = widget.onTap!();
                    if (temp != null && temp == true) {
                      context.read<CreateModelBloc>().add(BaseCreateModelEvent());
                    }
                  } else {
                    context.read<CreateModelBloc>().add(BaseCreateModelEvent());
                  }
                },
                child: widget.child);
          }
        },
        listener: (context, state) {
          if (state is CreateModelSuccessfully) {
            if (widget.onSuccess != null) widget.onSuccess!(state.model);
          }
          if (state is Error) {
            if (widget.errorWidget != null) {
              Navigator.push(context,MaterialPageRoute(builder: (context) => widget.errorWidget!));
            } else if (widget.onError != null) {
             widget.onError!(state.message.toString());
            } else {
              Dialogs.showSnackBar(message: state.message.toString(), typeSnackBar: AnimatedSnackBarType.error);
            }
          }
        });
  }
}