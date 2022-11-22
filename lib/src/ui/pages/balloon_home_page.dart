import 'package:bdb_challenge/src/core/models/hotels_model.dart';
import 'package:bdb_challenge/src/core/repository/hotels_repo.dart';
import 'package:bdb_challenge/src/ui/widgets/hotels_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: HotelRepository().hotels,
            builder: (context, AsyncSnapshot<List<Hotel>> snapshot) {
              if (snapshot.hasData) {
                return PageView.builder(
                  controller: _controller,
                  padEnds: false,
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) => HotelVideo(
                    hotel: snapshot.data![index],
                  ),
                );
              } else {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
            }),
      ),
    );
  }
}
