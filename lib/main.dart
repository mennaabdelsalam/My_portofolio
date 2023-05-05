import 'dart:math';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menna\'s portofolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isAnimationCompleted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _isAnimationCompleted = true;
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background section
          AnimatedBackground(animation: _animation),

          // Main content section
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner section
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                      image: AssetImage('assets/images/baner.png'),
                      fit: BoxFit.cover,
                    ),
                    /*gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.pinkAccent,
                        Colors.blue,
                      ],
                    ),*/
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.9),
                          Colors.black.withOpacity(.3),
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        //Row()
                        CircleAvatar(
                          radius: 100,
                          backgroundImage:AssetImage('assets/images/me.jpeg'),

                        ),
                        SizedBox(height: 10),
                        Text(
                          '    Hii ! I am Menna Abdelsalam',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '             And That \'s my portofolio',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialMediaButton(
                      icon: Icons.mail_outline,
                      color: Colors.red,
                      text: 'email',
                      url: 'menaabdelmeguid22@gmail.com',
                    ),
                    SocialMediaButton(
                      icon: Icons.code,
                      color: Colors.green,
                      text: 'Guithub',
                      url: 'https://github.com/mennaabdelsalam',
                    ),
                    SocialMediaButton(
                      icon: Icons.link,
                      color: Colors.blue,
                      text: 'Linkedin',
                      url: 'https://www.linkedin.com/in/menna-abdel-salam-6452291b2',
                    ),
                    SocialMediaButton(
                      icon: Icons.person,
                      color: Colors.purple,
                      text: 'My resume',
                      url: 'https://docs.google.com/document/d/1Zop2M3Ale1pdSCJv_Vp8HaDebtAaQ8qu/edit',
                    ),
                  ],
                ),
                // Introduction section

                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 30,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Me',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'I\'m a software engineer with enough experience. I have worked on a variety of projects, ranging from mobile and web apps to enterprise software solutions. I\'m passionate about creating high-quality software that solves real-world problems and provides value to users. \n'
                            'I graducated from faculty of engineering at Alexandria university \nI am a mobile developer freelancer, I helped many clinical and medical students to visualize their work on interactive mobile apps.'
                        '\nAlso, I dove into many fields of computer science such as web development, mobile development, machine learning, and deep learning.'
                        '\nI consider myself an eager learner, and hard worker, I am very skilled in problem-solving and competitive programming.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Skills',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        children: [
                          SkillChip('Flutter'),
                          SkillChip('Dart'),
                          SkillChip('Java'),
                          SkillChip('Kotlin'),
                          SkillChip('Javascript'),
                          SkillChip('C++/C'),
                          SkillChip('C#'),
                          SkillChip('Python'),
                          SkillChip('PHP'),
                          SkillChip('SQL'),
                          SkillChip('MySQL'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Projects that I am proud of',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      ProjectCard(
                        title: 'Submit',
                        description:
                        'A mobile app that provides online classroom application that provides courses and learning paths in Kuwait.',
                        image:'assets/images/submit.png',

                        projectUrl: 'https://apps.apple.com/eg/app/submit/id1640553923',
                      ),
                      SizedBox(height: 20),
                      ProjectCard(
                        title: 'Aggarly',
                        description:
                        'bike-renting mobile app to facilitate bike renting process in Egypt using Flutter, Dart and Firebase.',
                        image:'assets/images/submitt.png',
                        projectUrl: 'https://github.com/mennaabdelsalam/Agarly-renting-flutter-project',
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Let\'s Connect',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'If you\'d like to discuss a project or just say hi, feel free to drop me an email at ',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 5),
                      InkWell(
                        onTap: () => launch('menaabdelmeguid22.com'),
                        child: Text(
                          'menaabdelmeguid22@gmail.com',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;

  SkillChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String projectUrl;

  ProjectCard({
    required this.title,
    required this.description,
    required this.image,
    required this.projectUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      child: Card(

        color: Colors.grey[800],

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //width: 100,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () => launch(projectUrl),
                    child: Text(
                      'Learn more',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedBackground extends StatelessWidget {
  final Animation<double> animation;
  final Random random = Random();

  AnimatedBackground({required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(00000),
              ],
            ),
          ),
        );
      },
    );
  }
}
class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final String url;

  SocialMediaButton({
    required this.icon,
    required this.color,
    required this.text,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton.extended(
      backgroundColor: Colors.black54,
      icon: Icon(
        icon,
        color: Colors.deepPurpleAccent,

      ),

      //color: color,
      onPressed: () {
        launch(url);
      }, label: Text(text),

    );

  }
}