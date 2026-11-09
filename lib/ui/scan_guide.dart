import 'package:flutter/material.dart';
import 'face_scan_screen.dart';
import 'home_screen.dart';

class ScanGuideScreen extends StatelessWidget {
  final String userName;
  ScanGuideScreen({super.key, this.userName = "[Nama]"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tombol Lewati / Kembali ke Beranda
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFFE0E0E0)),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black87, size: 20),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(userName: userName),
                        ),
                        (route) => false,
                      );
                    },
                    child: Text(
                      "Ke Beranda",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD97059),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Cara scan wajah",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "Ikuti 4 langkah ini agar hasil analisis lebih akurat.",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  color: Color(0xFFFFF0EC),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Icon(
                    Icons.face,
                    size: 80,
                    color: Color(0xFFD97059),
                  ),
                ),
              ),
              SizedBox(height: 24),
              _buildStepItem(
                "1",
                "Cari cahaya yang cukup",
                "Hadap jendela atau lampu terang. Hindari bayangan di wajah.",
              ),
              SizedBox(height: 16),
              _buildStepItem(
                "2",
                "Wajah bersih dan terlihat",
                "Lepas kacamata, masker, dan topi. Rapikan rambut dari dahi, sebaiknya tanpa makeup.",
              ),
              SizedBox(height: 16),
              _buildStepItem(
                "3",
                "Posisikan wajah di bingkai",
                "Kamera sejajar mata, jarak sekitar 30 cm, wajah menghadap lurus.",
              ),
              SizedBox(height: 16),
              _buildStepItem(
                "4",
                "Ekspresi netral",
                "Tahan sebentar sampai foto terambil dan jangan bergerak.",
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFD3C6),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FaceScanScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Mulai scan",
                    style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepItem(String number, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Color(0xFFFFD3C6),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 2),
              Text(
                description,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}