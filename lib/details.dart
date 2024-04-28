import 'package:flutter/material.dart';

import 'main.dart';

class Details extends StatefulWidget {
  final String containerName;

  const Details({super.key,required this.containerName});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyApp(),
                ),
              );
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(10.0)),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Center(
          child: Text(
            widget.containerName,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [],
            iconColor: Colors.white,
            iconSize: 32,
          )
        ],
        backgroundColor: const Color(0xFF2CAB00),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitLayout(screenWidth, screenHeight)
              : _buildLandscapeLayout(screenWidth, screenHeight);
        },
      ),
    );
  }

  Widget _buildPortraitLayout(double screenWidth, double screenHeight) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTopImage(screenWidth, screenHeight),
          const SizedBox(height: 5),
          _buildTitleAndDescription(),
          const SizedBox(height: 10),
          _buildSeeMoreButton(),
          const SizedBox(height: 16),
          _buildSuggestionsTitle(),
          const SizedBox(height: 8),
          _buildSuggestionsGrid(screenWidth, screenHeight),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout(double screenWidth, double screenHeight) {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTopImage(screenWidth, screenHeight),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTitleAndDescription(),
                const SizedBox(height: 8),
                _buildSuggestionsTitle(),
                const SizedBox(height: 10),
                _buildSeeMoreButton(),
                const SizedBox(height: 8),
                _buildSuggestionsGrid(screenWidth, screenHeight),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopImage(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.92,
      height: screenHeight * 0.33,
      margin: const EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: AssetImage('images/mood1.jpeg'),
          // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 15),
          child: Text(
            'Mood with nature',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 39, vertical: 1),
          child: Text(
            'Being in nature, or even viewing scenes of nature, reduces anger, fear, and stress and increases pleasant feelings',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSeeMoreButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 140),
          textStyle: const TextStyle(fontSize: 26.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5.0,
          backgroundColor: const Color(0xFF2CAB00),
        ),
        child: const Text(
          'See More',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestionsTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 39, vertical: 1),
      child: Text(
        'Suggestions',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
          color: Color(0xFF2CAB00),
        ),
      ),
    );
  }

  Widget _buildSuggestionsGrid(double screenWidth, double screenHeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children: [
          _buildSuggestionItem(
              screenWidth, screenHeight, 'images/one.jpeg', 'Dawn', 25),
          _buildSuggestionItem(
              screenWidth, screenHeight, 'images/two.jpeg', 'Leaves', 20),
        ],
      ),
    );
  }

  Widget _buildSuggestionItem(double screenWidth, double screenHeight,
      String imagePath, String title, double fontSize) {
    return Container(
      width: screenWidth * 0.45,
      height: screenHeight * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
