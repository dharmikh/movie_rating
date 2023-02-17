import 'package:flutter/material.dart';
import 'package:movie_ratig/Screen/Model/HomeMoel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/http_app.dart';
import '../HomeProvider/HomeProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProvider? providert;
  HomeProvider? providerf;

  @override
  Widget build(BuildContext context) {
    providert = Provider.of<HomeProvider>(context, listen: true);
    providerf = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding:  EdgeInsets.all(5),
            child: Container(
              height: 6.h,
              width: 160.w,
              child: TextField(
                onSubmitted: (value) {
                  providert!.AddData();
                  Movie().moviedata("${providert!.search==""?"kgf":providert!.search}");
                },
                controller: providert!.txtScerch,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white),
                  border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                ),
                cursorColor: Colors.white,
              ),
            ),
          ),
          backgroundColor: Color(0xFFAACB73),
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/image/hello.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black54,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: FutureBuilder<HomeMoel?>(
                future: Movie().moviedata("${providert!.search==""?"kgf":providert!.search}"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return SingleChildScrollView(
                      child: Center(
                        child: Text("${snapshot.error}"),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    HomeMoel? Data = snapshot.data;
                    print("=========== ${Data!.d![0].l}");
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 50.sp),
                            child: Container(
                              height: 35.h,
                              width: 75.w,
                              // child: Text("${Data!.q}"),
                              child: Image.network("${Data!.d![0].i!.imageUrl}",fit: BoxFit.fill,),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.h, right: 30,left: 10.w),
                                    child: Text("Rank               : ",
                                        style: GoogleFonts.playfairDisplay(
                                            color: Color(0xFFFFFBF5), fontSize: 20)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.h, right: 30),
                                    child: Text("${Data.d![0].rank}",
                                        style: GoogleFonts.playfairDisplay(
                                            color: Color(0xFFFFFBF5), fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.w,left: 9.w),
                                    child: Text("Movie Name   :",
                                        style: GoogleFonts.playfairDisplay(
                                            color: Color(0xFFFFFBF5), fontSize: 20)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: Text("${Data.d![0].l }",
                                        style: GoogleFonts.playfairDisplay(
                                            color: Color(0xFFFFFBF5), fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: 10),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.w,left: 8.w),
                                    child: Text("Release Date   :",
                                        style: GoogleFonts.playfairDisplay(
                                            color: Color(0xFFFFFBF5), fontSize: 20)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: Text(" ${Data.d![0].y}",
                                        style: GoogleFonts.playfairDisplay(
                                            color: Color(0xFFFFFBF5), fontSize: 20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
