import 'package:flutter/material.dart';
import 'package:qt/models/lessions_model.dart';

class DetailLessionPage3 extends StatefulWidget {
  final Lessions lession;

  const DetailLessionPage3({super.key, required this.lession});

  @override
  State<DetailLessionPage3> createState() => _DetailLessionPage3State();
}

class _DetailLessionPage3State extends State<DetailLessionPage3> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, // 5% от ширины
          vertical: height * 0.02,  // 2% от высоты
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.01),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, size: width * 0.07),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            Center(
              child: Text(
                widget.lession.description4,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.06, // 6% от ширины
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            Text(
              widget.lession.detLessionText4,
              style: TextStyle(
                fontSize: width * 0.045, // 4.5% от ширины
              ),
            ),
            SizedBox(height: height * 0.03),
          ],
        ),
      ),
    );
  }
}
