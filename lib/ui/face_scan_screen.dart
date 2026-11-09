import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'skin_analysis_screen.dart';

class FaceScanScreen extends StatefulWidget {
  FaceScanScreen({super.key});

  @override
  State<FaceScanScreen> createState() => _FaceScanScreenState();
}

class _FaceScanScreenState extends State<FaceScanScreen> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras != null && cameras!.isNotEmpty) {
        CameraDescription frontCamera = cameras!.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
          orElse: () => cameras!.first,
        );

        _controller = CameraController(
          frontCamera,
          ResolutionPreset.high,
          enableAudio: false,
        );

        await _controller!.initialize();
        if (!mounted) return;
        setState(() {
          _isCameraInitialized = true;
        });
      }
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF131F1A),
      body: Stack(
        children: [
          _isCameraInitialized && _controller != null
              ? SizedBox.expand(
                  child: CameraPreview(_controller!),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFFFD3C6),
                  ),
                ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Scan wajah",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Text(
                              "Tutup",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.check, size: 14, color: Color(0xFFFFD3C6)),
                                SizedBox(width: 6),
                                Text(
                                  "Cahaya cukup",
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.check, size: 14, color: Color(0xFFFFD3C6)),
                                SizedBox(width: 6),
                                Text(
                                  "Wajah terdeteksi",
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: CustomPaint(
                    painter: DashedOvalPainter(),
                    child: SizedBox(
                      width: 240,
                      height: 320,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 32.0, left: 24, right: 24),
                  child: Column(
                    children: [
                      Text(
                        "Posisikan wajah di dalam oval dan tahan sebentar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white54, width: 1.5),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.image_outlined, color: Colors.white, size: 20),
                              onPressed: () {},
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SkinAnalysisScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 3),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFD3C6),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.camera, color: Colors.black87, size: 30),
                              ),
                            ),
                          ),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white54, width: 1.5),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.timer_outlined, color: Colors.white, size: 20),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
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

class DashedOvalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFFFFD3C6)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    Path ovalPath = Path()
      ..addOval(Rect.fromLTWH(0, 0, size.width, size.height));

    Path dashPath = Path();
    double dashWidth = 8.0;
    double dashSpace = 6.0;

    for (ui.PathMetric metric in ovalPath.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        dashPath.addPath(
          metric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}