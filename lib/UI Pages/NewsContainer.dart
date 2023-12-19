import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //      Image.network("https://images.unsplash.com/photo-1682686580186-b55d2a91053c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8")
            //      child: Image.network("https://plus.unsplash.com/premium_photo-1700012853644-e09bf0a02806?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1MHx8fGVufDB8fHx8fA%3D%3D")
              child: SizedBox(
                height: 160, // Set the desired fixed height here
                width: MediaQuery.of(context).size.width,
                // width: 450,
                // child: Image.network("https://plus.unsplash.com/premium_photo-1700012853644-e09bf0a02806?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1MHx8fGVufDB8fHx8fA%3D%3D",
                child: Image.network("https://images.unsplash.com/photo-1476610182048-b716b8518aae?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTl8fGxhbmRzY2FwZXxlbnwwfHwwfHx8MA%3D%3D",
                  // height:180 ,
                  //     width: 500
                ),
              )
          ),
          Padding(padding: EdgeInsets.only(left: 5,right: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Flexible(
                    child: Text("The setting of the sun in the cool breeze",
                      // child: Text("",
                      // softWrap: false,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                  )
                ]
            ),

          ),
          Padding(
              padding: EdgeInsets.only(right: 5,left: 5),
              child: Text("The sun was setting behind the mountains, casting a warm golden glow across the landscape. The air was crisp, and a gentle breeze rustled through the trees. Nature has a way of grounding us, reminding us of the beauty and simplicity of life.")),
          Padding(
            padding: EdgeInsets.only(right: 5,bottom: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lime[300], // Set the background color
                        onPrimary: Colors.white, // Set the text color
                      ),
                      onPressed: (){

                      },
                      child: Text("Read more",
                        style: TextStyle(
                            color: Colors.black
                        ),)
                  ),

                ]
            ),
          )
        ],
      ),
    );
  }
}
