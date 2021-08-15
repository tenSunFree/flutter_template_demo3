import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_demo3/home/update/home_cubit.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getData();
  }

  @override
  Widget build(BuildContext context) {
    var width = ScreenUtil.getScreenW(context);
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
          listener: (listenerContext, state) {},
          builder: (context, state) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(0xFF181818),
              child: Column(children: [
                buildTopBar(width),
                buildContent(state, width),
                buildBottomBar(width),
              ]),
            );
          }),
    );
  }

  Container buildBottomBar(double width) {
    return Container(
      width: width,
      height: width * 224 / 1440,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/icon_home_bottom_bar.png"),
              fit: BoxFit.contain)),
    );
  }

  Container buildTopBar(double width) {
    return Container(
      width: width,
      height: width * 485 / 1440,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/icon_home_top_bar.png"),
              fit: BoxFit.fitWidth)),
    );
  }

  Widget buildContent(HomeState state, double width) {
    if (state is SuccessState) {
      return Expanded(
        child: Container(
            child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return buildContentFirstIndex(state, index);
                  } else if (index == state.list.length - 1) {
                    return buildContentLastIndex(state, index);
                  } else {
                    return Container(
                      color: Color(0xFF222222),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: Column(children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('ID︰${state.list[index].id}'),
                                SizedBox(height: 5),
                                Text('Title︰${state.list[index].title}')
                              ]),
                        ),
                        Container(
                            color: Color(0xFF2B2B2B),
                            width: double.infinity,
                            height: 1)
                      ]),
                    );
                  }
                })),
      );
    } else if (state is FailureState) {
      return Expanded(child: Center(child: Text(state.error.toString())));
    } else {
      return Expanded(child: Center(child: CircularProgressIndicator()));
    }
  }

  Column buildContentLastIndex(SuccessState state, int index) {
    return Column(children: [
      Container(
          color: Color(0xFF222222),
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('ID︰${state.list[index].id}'),
                    SizedBox(height: 5),
                    Text('Title︰${state.list[index].title}')
                  ]),
            ),
            Container(
                color: Color(0xFF2B2B2B), width: double.infinity, height: 1)
          ])),
      SizedBox(height: 10),
    ]);
  }

  Column buildContentFirstIndex(SuccessState state, int index) {
    return Column(children: [
      SizedBox(height: 10),
      Container(
          color: Color(0xFF222222),
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('ID︰${state.list[index].id}',
                        textAlign: TextAlign.left),
                    SizedBox(height: 5),
                    Text('Title︰${state.list[index].title}')
                  ]),
            ),
            Container(
                color: Color(0xFF2B2B2B), width: double.infinity, height: 1)
          ])),
    ]);
  }
}
