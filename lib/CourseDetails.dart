import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../Data/Data.dart'; // Adjust if needed

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CourseDetailPage());
  }
}

class CourseDetailPage extends StatefulWidget {
  @override
  _CourseDetailPageState createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  late VideoPlayerController _controller;
  final List<lessonData> lessons = generateRandomLessons(24); // Declare lessons

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/videos/video.mp4', // Make sure this is correct
      )
      ..initialize().then((_) {
        setState(() {}); // Refresh UI after initialization
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Course Detail')),
      body: Column(
        children: [
          // Static Video Player
          _controller.value.isInitialized
              ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
              : Center(child: CircularProgressIndicator()),

          VideoProgressIndicator(_controller, allowScrubbing: true),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: () {
                  // Previous video functionality
                },
              ),
              IconButton(
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: () {
                  // Next video functionality
                },
              ),
            ],
          ),

          // Scrollable Course Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Course Title and Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product Design v1.0',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$74.00',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      '6h 14min - 24 Lessons',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 16),

                    // About the Course
                    Text(
                      'About this course',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Sed ut perspiciatis unde omnis iste notus error sit voluptatem accusantium doloremque laudantium.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),

                    // Lesson List
                    Text(
                      'Lessons',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Correct ListView inside Column
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: lessons.length,
                        itemBuilder: (context, index) {
                          final lesson = lessons[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            child: Row(
                              children: [
                                // Lesson Number
                                Text(
                                  '${(index + 1).toString().padLeft(2, '0')}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 12),

                                // Lesson Details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Lesson Title
                                      Text(
                                        lesson.title,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 4),

                                      // Duration and Completion Status
                                      Row(
                                        children: [
                                          Text(
                                            '${lesson.duration} mins',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          Icon(
                                            lesson.isCompleted
                                                ? Icons.check_circle
                                                : Icons.radio_button_unchecked,
                                            color:
                                                lesson.isCompleted
                                                    ? Colors.orange
                                                    : Colors.grey,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                // Play Button
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.redAccent,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      // Handle play button tap
                                      print("Playing ${lesson.title}");
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // Buy Now Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Buy Now functionality
          print("Course Purchased!");
        },
        label: Text('Buy Now'),
        icon: Icon(Icons.shopping_cart),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
