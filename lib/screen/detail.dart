import 'package:ailoitte_task/models/drinks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  Detail({Key? key, required this.drinks}) : super(key: key);
  Drinks drinks;

  TextStyle richTextHeader = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green);

  TextStyle richTextChild= const TextStyle(
  fontSize: 14, color: Colors.black87);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(drinks.strDrink),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                textDirection: TextDirection.rtl,
                fit: StackFit.loose,
                clipBehavior: Clip.hardEdge,
                children: [
                  SizedBox(
                    height: 200,
                    child: AspectRatio(
                      aspectRatio: 16.9,
                      child: Image.network(
                        drinks.strDrinkThumb,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),

                  ///jeson_shr, jso_ano
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 115,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.transparent,
                          Colors.white10,
                          Colors.white70,
                          Colors.white,
                        ],
                      )),
                      child: Padding(
                        padding: EdgeInsets.only(top: 40, left: 10, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              drinks.strDrink,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "(${drinks.strCategory})",
                              style: const TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${drinks.strAlcoholic}",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text("Glass: ${drinks.strGlass}"),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Instructions',
                        style: richTextHeader,
                        children: <TextSpan>[
                          TextSpan(
                              text: "\n${drinks.strInstructions}",
                              style: richTextChild),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Instructions DE',
                        style: richTextHeader,
                        children: <TextSpan>[
                          TextSpan(
                              text: "\n${drinks.strInstructionsDE}",
                              style: richTextChild),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Instructions IT',
                        style: richTextHeader,
                        children: <TextSpan>[
                          TextSpan(
                              text: "\n${drinks.strInstructionsIT}",
                              style: richTextChild),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}