import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'gamescreen.dart';

List<String> words = ["beach", "zephyr", "biography", "hunter", "shadow", "exact", "leopard","bumpy",
                      "twirl","jumbled", "frenzy","majestic","jovial", "twinkle","enquiry"];

List<String> hint = ["Small saltwater body", "Rapid movement", "literature on a person", "one who kill animal",
  "body's reflection", "Precise and accurate", "family member of cats","Having small raised areas",
  "Spin or rotate quickly","Mixed up and confused", "Wild and chaotic",
  "Grand and impressive","Cheerful and friendly", "Shine with a flickering light","Seeking information"];

class levelscreen extends StatelessWidget {
  List level = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.fill,
              height: double.infinity,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                children: [
                 const SizedBox(height: 50,),
                 const Text('Level',style: TextStyle(fontSize: 40,color: Colors.white),),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          mainAxisSpacing: 20,crossAxisSpacing: 20,
                          childAspectRatio: 1.1

                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){ Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return gamescreen(index: index,hint: hint[index],word: words[index],);
                                },
                              ),
                            );},
                            child: Container(

                              child: Center(
                                child: Text("${level[index]+1}", style: GoogleFonts.kalam(
                                    textStyle: TextStyle(color: Colors.white, fontSize: 40)),),
                              ),
                              decoration: BoxDecoration(shape: BoxShape.rectangle,border:Border.all(color: Colors.black,width: 4),
                              borderRadius: BorderRadius.all( Radius.elliptical(20, 30),), ),
                            ),
                          );
                        },
                        itemCount: level.length),
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
