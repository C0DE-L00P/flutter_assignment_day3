import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_event.dart';

class ColorsBloc extends Bloc<ColorsEvent,List<Color>>{
  ColorsBloc(List<Color> initialState):super(initialState){
    
    
    on<ChangeColors>((event, emit){
      print("changed");
      emit([Colors.grey,Colors.black,Colors.blue]);
    });

    on<ResetColors>((event, emit){
      print("resetted");
      emit(initialState);
    });
  }
}