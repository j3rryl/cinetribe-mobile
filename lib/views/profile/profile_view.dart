import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Profile"),
      //   backgroundColor: Colors.black,
      // ),
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.teal,
                image: DecorationImage(
                  image: NetworkImage("https://www.vanulaw.com/wp-content/uploads/2017/10/house-03.jpg"),
                  fit: BoxFit.cover
                )
               ),
              ),
              SizedBox(height: 10.0,),
              Align(
              alignment: Alignment.center,
              child: Text(
                "Realtor Experience",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.0
                ),
              ),
            ),

                SizedBox(height: 20.0,),
                GestureDetector(
  onTap: () {
  },
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(Icons.person, color: Colors.teal,),
          SizedBox(width: 10.0,),
          Text(
            "My Account",
            style: TextStyle(color: Colors.grey),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Icon(Icons.arrow_forward_ios, color: Colors.teal.shade400, size: 16),
          ),
        ],
      ),
    ),
  ),
),

                SizedBox(height: 12.0,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Icons.settings, color: Colors.teal,),
                        SizedBox(width: 10.0,),
                        Text(
                          "Settings",
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        ),
                        Spacer(),  // This will push the next icon to the end
                        Container(
                          padding: EdgeInsets.all(8.0), // You can adjust this for desired spacing
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,  // Background color of the circular container
                            borderRadius: BorderRadius.circular(50.0),  // Making it circular
                          ),
                          child: Icon(Icons.arrow_forward_ios, color: Colors.teal.shade400,size: 16,),  // Adjusting the arrow color for better visibility against teal background
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.0,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Icons.support_agent, color: Colors.teal,),
                        SizedBox(width: 10.0,),
                        Text(
                          "Support",
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        ),
                        Spacer(),  // This will push the next icon to the end
                        Container(
                          padding: EdgeInsets.all(8.0), // You can adjust this for desired spacing
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,  // Background color of the circular container
                            borderRadius: BorderRadius.circular(50.0),  // Making it circular
                          ),
                          child: Icon(Icons.arrow_forward_ios, color: Colors.teal.shade400,size: 16,),  // Adjusting the arrow color for better visibility against teal background
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.0,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: Colors.teal),
                        SizedBox(width: 10.0),
                        Text(
                          "Log Out",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Spacer(),  // This will push the next icon to the end
                        Container(
                          padding: EdgeInsets.all(8.0), // You can adjust this for desired spacing
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,  // Background color of the circular container
                            borderRadius: BorderRadius.circular(50.0),  // Making it circular
                          ),
                          child: Icon(Icons.arrow_forward_ios, color: Colors.teal.shade400,size: 16,),  // Adjusting the arrow color for better visibility against teal background
                        ),
                      ],
                    ),


                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}