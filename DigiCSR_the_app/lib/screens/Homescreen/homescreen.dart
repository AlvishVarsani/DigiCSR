import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/screens/company/rfp.dart';
import 'package:digicsr/screens/ngo/rfpngo.dart';
import 'package:digicsr/widgets/appbar.dart';
import 'package:digicsr/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:digicsr/widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

ScrollController _scrollController = ScrollController();

List<String> list = [
  '''No one is useless in this world who lightens the burdens of another.''',
  'There could be no definetion of a successful life that does not include service to others.',
  'It\'s not how much we give, but how much love we put into giving.',
  'Hello',
];


class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(context),
      body: SafeArea(
          child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.22,
          child: Row(
            children: [
              Expanded(child: Container()),
              Card(
                elevation: 30,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    side: BorderSide(width: 1.2, style: BorderStyle.solid)),
                child: Container(
                  // padding: EdgeInsets.fromLTRB(MediaQuery.sizeOf(context).width*0.1, 5, 8, 5),

                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(style: BorderStyle.solid, width: 1.2)),

                  // alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: ListView.builder(
                      // padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.01),
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      shrinkWrap: true,
                      itemBuilder: (buildContext, index) {
                        return Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(14, 5, 0, 5),
                            // height: MediaQuery.of(context).size.height*0.16,
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: Text(
                              list[index],
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  color: black,
                                  fontStyle: FontStyle.italic),
                            )
                            // child: Image.asset(list[index],fit: BoxFit.cover,)
                            );
                      }),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ])),
      bottomNavigationBar: CustomBottomNavBar(pages)
    );
  }
}
