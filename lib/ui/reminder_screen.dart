import 'package:flutter/material.dart';

class ReminderScreen extends StatefulWidget {
  ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  // Status toggle sakelar untuk masing-masing pengingat
  bool isMorningSkincareOn = true;
  bool isNightSkincareOn = true;
  bool isRoutineCareOn = false;
  bool isWeeklyScanOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Tombol Kembali & Judul "Pengingat"
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFFE0E0E0)),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 18),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "Pengingat",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Kartu Pengingat 1: Skincare Pagi
              _buildReminderCard(
                title: "Skincare pagi",
                subtitle: "Setiap hari 07:00",
                value: isMorningSkincareOn,
                onChanged: (val) {
                  setState(() {
                    isMorningSkincareOn = val;
                  });
                },
              ),
              SizedBox(height: 16),

              // Kartu Pengingat 2: Skincare Malam
              _buildReminderCard(
                title: "Skincare malam",
                subtitle: "Setiap hari 20:00",
                value: isNightSkincareOn,
                onChanged: (val) {
                  setState(() {
                    isNightSkincareOn = val;
                  });
                },
              ),
              SizedBox(height: 16),

              // Kartu Pengingat 3: Rutinitas Perawatan
              _buildReminderCard(
                title: "Rutinitas perawatan",
                subtitle: "Mingguan, atur hari",
                value: isRoutineCareOn,
                onChanged: (val) {
                  setState(() {
                    isRoutineCareOn = val;
                  });
                },
              ),
              SizedBox(height: 16),

              // Kartu Pengingat 4: Scan Ulang Mingguan
              _buildReminderCard(
                title: "Scan ulang mingguan",
                subtitle: "Setiap Minggu 09:00",
                value: isWeeklyScanOn,
                onChanged: (val) {
                  setState(() {
                    isWeeklyScanOn = val;
                  });
                },
              ),
              SizedBox(height: 40),

              // Tombol Simpan Pengaturan
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
                    print("Simpan pengaturan pengingat diklik");
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Simpan pengaturan",
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

  // Widget pendukung untuk Kartu Pengingat dengan Switch
  Widget _buildReminderCard({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFE8E8E8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          Switch(
            value: value,
            activeColor: Colors.black87,
            activeTrackColor: Color(0xFFFFD3C6),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Color(0xFFDCDCDC),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}