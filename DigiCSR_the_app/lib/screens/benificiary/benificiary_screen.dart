import 'package:digicsr/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:digicsr/models/NgoModel.dart';
import 'package:digicsr/services/get_all_ngos.dart';
import 'package:digicsr/screens/ngo/NgoDetailsToOthers.dart';
import 'package:digicsr/widgets/filter_option.dart';

class BeneficiaryHomeScreen extends StatefulWidget {
  const BeneficiaryHomeScreen({super.key});

  @override
  State<BeneficiaryHomeScreen> createState() => _BeneficiaryHomeScreenState();
}

class _BeneficiaryHomeScreenState extends State<BeneficiaryHomeScreen> {
  late Future<List<Ngo>> ngos;
  List<Ngo> allNgos = []; // Store all NGOs fetched from the API
  List<Ngo> filteredNgos = []; // Store filtered NGOs based on the search
  TextEditingController searchController = TextEditingController();

  void allngos() {
    ngos = getAllNgos();
  }

  @override
  void initState() {
    super.initState();
    allngos();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // Function to filter NGOs based on the search text
  void filterNgos(String searchText) {
    filteredNgos = allNgos.where((ngo) {
      // Convert both the NGO name and search text to lowercase for a case-insensitive search
      return ngo.ngo_name!.toLowerCase().contains(searchText.toLowerCase());
    }).toList();
    setState(() {}); // Trigger a rebuild to update the displayed NGOs
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) => 
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 60,
                // color: Color.fromARGB(77, 138, 199, 233).withOpacity(0.5),
                child: TextFormField(
                  controller: searchController,
                  onChanged: filterNgos, // Call the filter function on text change
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return FiterOption();
                          },
                        );
                      },
                      icon: Icon(Icons.filter_alt),
                    ),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search Anything",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.85,
                child: FutureBuilder(
                  future: ngos,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // Save the fetched NGOs to the allNgos list
                      allNgos = snapshot.data as List<Ngo>;
                      // If search text is empty or null, show all NGOs, else show filtered NGOs
                      final List<Ngo> displayedNgos =
                          searchController.text.isEmpty
                              ? allNgos
                              : filteredNgos;
        
                      return ListView.builder(
                        itemCount: displayedNgos.length,
                        itemBuilder: (context, index) => 
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: Container(
                                    // width: ,
                                    height: 46,
                                    child: Center(
                                      child: Text(
                                        "${displayedNgos[index].ngo_name}",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ListTile(
                                  leading: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  title: Text("${displayedNgos[index].email}"),
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                  ),
                                  title: Text("${displayedNgos[index].phone}"),
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                      "${displayedNgos[index].city}, ${displayedNgos[index].state}, ${displayedNgos[index].pincode}"),
                                ),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NgoDetailsToOthers(
                                            displayedNgos[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text("More details"),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(primary)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
        
                    return Center(
                      child: Container(
                        height: constraints.maxWidth * 0.1,
                        width: constraints.maxWidth * 0.1,
                        child: const CircularProgressIndicator(
                          strokeWidth: 1,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}