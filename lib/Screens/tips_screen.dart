import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iCOOK/components/bottomnavi.dart';
import 'chefbot.dart';

class TipsScreen extends StatefulWidget {
  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text(
            'iCOOK - Tips & Tricks',
            style: GoogleFonts.specialElite(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Container(
          child: ListView(children: <Widget>[
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xffFDCF09),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/cooking.png"),
                    backgroundColor: Colors.lime[200],
                    radius: 23,
                  ),
                ),
                title: Text(
                  'Cooking Tips',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TipsNTricks();
                      },
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xffFDCF09),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/chop.png"),
                    backgroundColor: Colors.lime[200],
                    radius: 23,
                  ),
                ),
                title: Text(
                  'Preparation & Chopping',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChoppingTips();
                      },
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xffFDCF09),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/fry.png"),
                    backgroundColor: Colors.lime[200],
                    radius: 23,
                  ),
                ),
                title: Text(
                  'Frying Tips',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FryingTips();
                      },
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xffFDCF09),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/preserve.png"),
                    backgroundColor: Colors.lime[200],
                    radius: 23,
                  ),
                ),
                title: Text(
                  'Food Storage Tips',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PreservationTips();
                      },
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xffFDCF09),
                  child: CircleAvatar(
                      backgroundColor: Colors.lime[200],
                      radius: 23,
                      backgroundImage: AssetImage("assets/images/cart.png")),
                ),
                title: Text(
                  'Food Shopping Tips',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ShoppingTips();
                      },
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xffFDCF09),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/health.png"),
                    backgroundColor: Colors.lime[200],
                    radius: 23,
                  ),
                ),
                title: Text(
                  'Health Tips',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HealthTips();
                      },
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
        floatingActionButton: Container(
          height: 80.0,
          width: 80.0,
          child: FittedBox(
            child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TipsScreen();
                      },
                    ),
                  );
                },
                child: Icon(
                  Icons.support_agent,
                  color: Colors.lightGreen[50],
                  size: 28.0,
                ),
                backgroundColor: Colors.red[200]),
          ),
        ),
      ),
    );
  }
}

Widget buildText(String labelText) {
  return Card(
    child: ListTile(
      leading: Icon(Icons.done),
      title: Text(
        labelText,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    ),
  );
}

class TipsNTricks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey[600]),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return BottomNavi();
                },
              ),
            );
          },
        ),
        title: Text(
          'Cooking Tips',
          style: GoogleFonts.specialElite(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child: Image.asset('assets/images/cooking1.jpg'),
              ),
              buildText(
                  'Read the recipe all the way through before you start.'),
              buildText('Put a damp paper towel under your cutting board.'),
              buildText('Use the right pans.'),
              buildText(
                  'Set your timer for a few minutes less than the called-for time.'),
              buildText(
                  'To get fluffy rice - Add a tbsp of fresh lemon juice when cooking rice to get fluffy and whiter grains.'),
              buildText('To soften butter faster – Cut it into small pieces.'),
              buildText(
                  'For tasty and fluffy omelets – Add a little milk or a tbsp of water when beating eggs.'),
              buildText(
                  'Retain the white color of cauliflower – Add a tbsp of milk while cooking cauliflower.'),
              buildText(
                  'Reheating leftover rice – Sprinkle water over the rice and then reheat it to get softer rice.'),
              buildText(
                  'To retain the green color of peas – Add a pinch of sugar when boiling green peas to retain their green colors.'),
            ],
          ),
        ),
      ),
    );
  }
}

class ChoppingTips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey[600]),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return BottomNavi();
                },
              ),
            );
          },
        ),
        title: Text(
          'Preparation & Chopping Tips',
          style: GoogleFonts.specialElite(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child: Image.asset('assets/images/chopping.jpg'),
              ),
              buildText(
                  'No more tears while chopping onions - Cut off both the ends, peel the onions and wash the onions under cold water.'),
              buildText(
                  'Make sure your knife is sharp, and it will do the work. You shouldn’t have to pit force into chopping your fruits and vegetables. If you do, this can be dangerous and can lead to the knife slipping.'),
              buildText(
                  'Consider getting two cutting boards. Use one to chop vegetables or fruit and use the other to chop meat.'),
              buildText(
                  'You could also use non-slip mats, wet paper towels, or poster putty underneath the cutting board to make sure your board doesn’t slips.'),
              buildText(
                  'Avoid chopping your food with small knives(like paring knives) since the knife could become stuck in the food or you may cut yourself. Don’t use it for small jobs, like peeling food or cutting bread.'),
              buildText(
                  'To chop, you’ll usually want to use an 8 to 10-inch(20 to 25 cm) chef’s knife.It has a slight curve, so you can rock the knife back and forth as you quickly chop.'),
              buildText(
                  'For peeling garlic easily, separate the cloves and soak it in water for 15 minutes.. Most of the skin comes loose and the rest can be removed easily.'),
              buildText(
                  'For chopping dry fruits, freeze them for an hour before cutting. This is also true for meat and processed meat like bacon, pancetta etc.'),
              buildText(
                  'When cutting raw banana, potatoes or eggplant, soak it in water to avoid discolouration. Similarly, to prevent apples, avocados, bananas or peaches from browning, add lemon juice.'),
              buildText(
                  'Wash the rice thoroughly until the water runs clear so that the excess starch gets drained away and the rice is not very sticky after cooking.'),
            ],
          ),
        ),
      ),
    );
  }
}

class FryingTips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey[600]),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return BottomNavi();
                },
              ),
            );
          },
        ),
        title: Text(
          'Frying Tips',
          style: GoogleFonts.specialElite(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child: Image.asset('assets/images/frying.jpg'),
              ),
              buildText(
                  'When frying, the oil should be in the correct temperature. If its too hot, the outside will get browned up too quickly before the inside gets cooked. If nits not hot enough, the fried food will absorb too much oil before getting cooked.'),
              buildText(
                  'Choose any oil with neutral flavor like vegetable oil, refined sunflower oil, canola oil etc. for frying. Oils with strong flavor like olive oil or coconut oil will change the taste of the fried food.'),
              buildText(
                  'To reduce the amount of oil absorbed by the food when fried, add a pinch of salt t the oil before frying.'),
              buildText(
                  'Before deep frying vegetables or fish or meat, pat it dry completely on a kitchen towel or using a paper napkin.'),
              buildText(
                  'Use a deep vessel to fry chicken to avoid the splashing of oil and juices all around the place. Use long tongs to put the foos to be fried carefully in the hot oil.'),
              buildText(
                  'When frying mushrooms, add salt only after it has browned. Similarly adding salt to the chicken also slows up the browning.'),
              buildText(
                  'If you find you need more oil in the pan when sautéing, add it in a stream along the edges of the pan so that by the time the oil reaches the ingredient being cooked, it will be heated.'),
              buildText(
                  'While it is not at all advisable to reuse fried oil, some people still prefer to.'),
              buildText(
                  'When you deep-fry, hold each piece of food with long tongs as you add it to the oil. Hold it just below the oil’s surface for five seconds before releasing it. This will seal the exterior and stop it from sticking to the pot or the other food.'),
              buildText(
                  'Want to know if your oil is hot enough for frying? Here’s a tip: Stick a wooden skewer or spoon in the oil. If bubbles form around the wood, then you are good to go.'),
            ],
          ),
        ),
      ),
    );
  }
}

class PreservationTips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey[600]),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return BottomNavi();
                },
              ),
            );
          },
        ),
        title: Text(
          'Food Storage Tips',
          style: GoogleFonts.specialElite(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child: Image.asset('assets/images/storage.jpg'),
              ),
              buildText(
                  'Storing leftover dough – Store leftover dough in the refrigerator in an airtight container after applying a little oil over it to prevent it from drying.'),
              buildText(
                  'To preserve ginger-garlic paste for a longer duration- Add a tbsp of hot cooking oil to ginger-garlic paste, mix well and store it in the refrigerator.'),
              buildText(
                  'Store the top plate of a stack of plates upside down. This will prevent dust and pests from settling on the surface of the plate used when eating.'),
              buildText(
                  'Group fragile stemware together and drape a cloth napkin on top to keep dust from settling inside.'),
              buildText(
                  'Wrap sterling silver serving platters and silverware in plastic wrap or resealable plastic bags to limit the silver’s exposure to air, which causes tarnishing.'),
              buildText(
                  'Slip a coffee filter in between stacks of plates to prevent nicks. '),
              buildText(
                  'Store serving vessels and stacks of plates in recycled-plastic dry cleaning bags to prevent dust from collecting.'),
              buildText(
                  'Store items in boxes to ward off dust and pests and for easy retrieval. Plus, use the boxes as a platform in your pantry for additional storage.'),
              buildText(
                  'Store spices in a cool, dark place, not above your stove. Humidity, light and heat will cause herbs and spices to lose their flavor.'),
              buildText(
                  'Always make stock in a large quantity and freeze it in plastic bags. '),
            ],
          ),
        ),
      ),
    );
  }
}

class ShoppingTips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey[600]),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return BottomNavi();
                },
              ),
            );
          },
        ),
        title: Text(
          'Food Shopping Tips',
          style: GoogleFonts.specialElite(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child: Image.asset('assets/images/shopping.jpg'),
              ),
              buildText(
                  'Always prepare a shopping list to avoid over buying based on instinct or under buying and missing out the necessary things.'),
              buildText(
                  'Always be sure to check the expired dates of product. Purchase large quantities only if your are sure to finish it within the date.'),
              buildText(
                  'While buying mutton, choose the meat that is pinkish and not dark red. This will ensure tender meat when cooked.'),
              buildText(
                  'When buying produce, look for its freshness. Do not purchase if it doesn’t look bright and firm.'),
              buildText(
                  'Choose eggplant that are lighter. Heavier ones are more mature with many seeds and the eggplant will also taste bitter.'),
              buildText(
                  'Always read the nutritional labels while buying canned or processed food. Compare similar products to check for salt content, fat etc. Also purchase low sodium options whenever possible.'),
              buildText(
                  'Purchase fish in bulk. This way you do not have to rush to the market often. If you clean and refrigerate in small portions, you will have fish ready for cooking any time.'),
              buildText(
                  'Buy fruit at its peak at a farmer’s market and freeze it in an airtight container so you can enjoy it year round.'),
              buildText(
                  'While purchasing fish, sniff the fish. A ‘fresh’ fish should not smell ‘fishy’, but should have the odour of the ocean such as a fresh ocean breeze. If the head is on, fresh fish should have clear eyes, no cloudiness should be present. They should bulge a little. The gills should be red in colour, the scales intact, firm and shiny.'),
              buildText(
                  'Always buy the freshest garlic you can find; the fresher it is, the sweeter it will be. The best garlic had firm tissue-like skin and should not be bruised, sprouted, soft or shrivelled. If you find cloves that have green shoots, discard the shoots - they will only add bitterness.'),
            ],
          ),
        ),
      ),
    );
  }
}

class HealthTips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey[600]),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return BottomNavi();
                },
              ),
            );
          },
        ),
        title: Text(
          'Health Tips',
          style: GoogleFonts.specialElite(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child: Image.asset('assets/images/health.jpg'),
              ),
              buildText(
                  'For easy digestion – Add a pinch of hing when cooking any dal, legumes, potato or plantain dishes to aid in digestion.'),
              buildText(
                  'Do not wash the vegetables after peeling or chopping. This will wash out all the water soluble vitamins.'),
              buildText(
                  'Try your best to steam or stir fry the vegetables to cook them and retain all its nutrients. However, if you need to boil the vegetables, do not throw the water. Many nutrients are left back in the water, so use it when making some gravies or soups.'),
              buildText(
                  'Potatoes, drumstick etc, have their nutrients in their skin. So ,try using them without peeling it. Also, eat fruits like apples along with its skin.'),
              buildText(
                  'Tamarind can be substituted with raw mango powder, lime juice, kokum etc. These are healthy alternatives.'),
              buildText(
                  'Use lot of garlic and asafoetida in recipe to avoid gastric problems. '),
              buildText(
                  'Add salt at the very end of the cooking process to reduce the overall salt intake. Also, adding salt in the beginning dehydrates the vegetables and reduces its nutritional value.'),
              buildText(
                  'Use half wheat flour for any recipes that call for refined flour (maida). This will improve the nutritious value of the dish.'),
              buildText(
                  'Cut the fat in your recipes wherever possible. Prevention is better than cure. E.g: use less oil, use less coconut in gravies and substitute with poppy seeds or tomatoes, substitute cream with milk.'),
              buildText(
                  'Eat fresh home cooked meals and snacks as much as possible. It is always mush healthier as you have a control over the ingredients used.'),
            ],
          ),
        ),
      ),
    );
  }
}
