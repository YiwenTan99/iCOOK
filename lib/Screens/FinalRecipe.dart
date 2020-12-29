import 'package:flutter/material.dart';

class Final extends StatefulWidget {
  bool fish,
      apple,
      orange,
      grape,
      carrot,
      broccoli,
      mushroom,
      strawberry,
      tomato,
      bellpepper,
      yellowtail;
  Final(
      this.fish,
      this.apple,
      this.orange,
      this.grape,
      this.carrot,
      this.broccoli,
      this.mushroom,
      this.strawberry,
      this.tomato,
      this.bellpepper,
      this.yellowtail,
      {Key key})
      : super(key: key);

  @override
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {
  @override
  List<String> process() {
    bool fish = widget.fish;
    bool apple = widget.apple;
    bool orange = widget.orange;
    bool grape = widget.grape;
    bool carrot = widget.carrot;
    bool broccoli = widget.broccoli;
    bool mushroom = widget.mushroom;
    bool strawberry = widget.strawberry;
    bool tomato = widget.tomato;
    bool bellpepper = widget.bellpepper;
    bool yellowtail = widget.yellowtail;
    List<String> selected = [];
    if (fish == false) {
      selected.add('Fish');
    }
    if (apple == false) {
      selected.add('Apple');
    }
    if (orange == false) {
      selected.add('Orange');
    }
    if (grape == false) {
      selected.add('Grape');
    }
    if (carrot== false) {
      selected.add('Carrot');
    }
    if (broccoli == false) {
      selected.add('Broccoli');
    }
    if (mushroom == false) {
      selected.add('Mushroom');
    }
    if (strawberry == false) {
      selected.add('Strawberry');
    }
    if (tomato == false) {
      selected.add('Tomato');
    }
    if (bellpepper == false) {
      selected.add('Bellpepper');
    }
    if (yellowtail == false) {
      selected.add('YellowTail Scad');
    }

    print(selected);
    print(selected.length);
    List<String> cook1 = ['Fish', 'Apple', 'Orange'];
    List<String> cook2 = ['Carrot', 'Broccoli', 'Pumpkin'];
    for (int i = 0; i < selected.length; i++) {
      for (int j = 0; j <= 2; j++) {
        if (selected[i] == cook1[j] || selected[i] == cook2[j]) {
          selected.removeAt(i);
        }
      }
    }
    return selected;
  }

  Widget build(BuildContext context) {
    List<String> recommended = [];
    recommended = process();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text('Food Recommendation')),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Text(
                  'Recommendations Testing',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
              ),
              Divider(
                color: Colors.red[300],
                thickness: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Items we recommend you Cook:',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 2000.0,
                      child: new ListView.builder(
                        itemCount: recommended.length,
                        itemBuilder: (context, position) {
                          return ListTile(
                            title: Center(
                              child: Text(recommended[position]),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
