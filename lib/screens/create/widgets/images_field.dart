import 'package:flutter/material.dart';

class ImagesField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[200],
          height: 140,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2 + 1,
              itemBuilder: (context, index) {
                if (index == 2) {
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 52,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.camera_alt,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              '+ inserir',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Container();
              }),
        ),
      ],
    );
  }
}
