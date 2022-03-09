import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
import 'api/api.dart';
import 'models/models.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ExamCubit()..fetch(),
          ),
        ],
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ExamCubit, ApiResponse>(
          builder: (context, state) {
            switch (state.status) {
              case Status.completed:
                final Exam data = state.data as Exam;
                if (data.p != null) {
                  return ListView.builder(
                    itemCount: (data.p!.length / 3).floor() + 1,
                    itemBuilder: (context, index) {
                      return ImageInRows(
                        imagePath: [
                          "http://g-pst.framy.co/stk/${data.p![index].id!}.jpg",
                          "http://g-pst.framy.co/stk/${data.p![index+1].id!}.jpg",
                          "http://g-pst.framy.co/stk/${data.p![index+2].id!}.jpg",
                        ],
                      );
                    },
                  );
                } else {
                  return Container();
                }
              case Status.loading:
                return Container();
              case Status.error:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
