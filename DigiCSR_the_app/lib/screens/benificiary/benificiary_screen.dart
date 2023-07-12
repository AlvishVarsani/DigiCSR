import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/screens/ngo/NgoDetailsToOthers.dart';
import 'package:digicsr/services/get_all_ngos.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../models/NgoModel.dart';
import '../../widgets/filter_option.dart';

class BeneficiaryHomeScreen extends StatefulWidget {
  const BeneficiaryHomeScreen({super.key});

  @override
  State<BeneficiaryHomeScreen> createState() => _BeneficiaryHomeScreenState();
}

class _BeneficiaryHomeScreenState extends State<BeneficiaryHomeScreen> {
  late Future<List<Ngo>> ngos;
  late Future<List<Ngo>> ngosupdate;
  void allngos(){
    ngos = getAllNgos();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allngos();
  }
  String context1 = "swdefr ert  ertggrfedwq 2w3e4rtg";
  bool isvisible10 = false;
  bool isvisible11 = false;
  String searchtext = '';

  List<Ngo> search(List<Ngo> ngos,String search_text){
    List<Ngo> searchedngos = [];

    for(int i = 0;i<ngos.length;i++){
      if(ngos[i].ngo_name!.contains(search_text)){
        searchedngos.add(ngos[i]);
      }
    }
    return searchedngos;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          //backgroundColor: Color.fromARGB(97, 243, 247, 249),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
            alignment: Alignment.center,
            height: 60,
            // color: ,
            child: TextFormField(
              controller: TextEditingController(text: searchtext),
              onChanged: (value)async{
                 search(await ngos, value);
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(onPressed: (){showDialog(context: context, builder: (BuildContext context) {
                  return FiterOption();
                });}, icon: Icon(Icons.filter_alt)),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                hintText: "Search Anything",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: FutureBuilder(
                    future: ngos,
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index)=>
                    Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 0.5,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: primary,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15))),
                                        child: ListTile(
                                          title: Center(
                                            child: Text(
                                              "${snapshot.data![index].ngo_name}",
                                              style: TextStyle(
                                                  fontSize: 20, color: Colors.white),
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.email,
                                        color: Colors.black,
                                      ),
                                      title: Text("${snapshot.data![index].email}"),
                                    ),
                          
                                    ListTile(
                                      leading: Icon(
                                        Icons.phone,
                                        color: Colors.black,
                                      ),
                                      title: Text("${snapshot.data![index].phone}"),
                                    ),
                          
                                    ListTile(
                                      leading: Icon(
                                        Icons.location_on,
                                        color: Colors.black,
                                      ),
                                      title: Text("${snapshot.data![index].city},${snapshot.data![index].state},${snapshot.data![index].pincode}"),
                                    ),
                                    Center(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll(primary)
                                          ),
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>NgoDetailsToOthers(snapshot.data![index])));
                                            },
                                            child: Text("More details"))),
                                  ]),
                            ),
                          ));
                
                          }else if(snapshot.hasError){
                            return Text("${snapshot.error}");
                          }
                
                          return Center(
                        child: Container(
                          height: MediaQuery.of(context).size.width*0.15,
                          width: MediaQuery.of(context).size.width*0.15,
                          child: const CircularProgressIndicator(
                            strokeWidth: 1,
                          ),
                        ),
                      );
                  }),
                ),
              ],
            )
          ),
        ),
     
    );
  }
}
