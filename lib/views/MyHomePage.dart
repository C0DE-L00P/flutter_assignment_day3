import 'package:bloc_container_colors/bloc/bloc_event.dart';
import 'package:bloc_container_colors/bloc/colors_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<ColorsBloc, List<Color>>(
              builder: (context, state) => Column(
                children: [
                  Container(height: 120, color: state[0]),
                  Builder(builder: (context) {
                    return Container(
                      height: 120,
                      color: state[1],
                    );
                  }),
                  Container(height: 120, color: state[2]),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<ColorsBloc>(context)
                            .add(ChangeColors());
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      child: const Text('Change colors',
                          style: TextStyle(color: Colors.black87))),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<ColorsBloc>(context).add(ResetColors());
                      // ColorsProvider provider = Provider.of<ColorsProvider>(context,listen: false);
                      // provider.resetColors();
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                    child: const Text(
                      'Reset colors',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
