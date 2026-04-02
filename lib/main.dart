import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const AfyaApp());
}

// ─────────────────────────── THEME ───────────────────────────
const kBlue      = Color(0xFF1565C0);
const kBlueDark  = Color(0xFF0D47A1);
const kBlueLight = Color(0xFFE3EDFF);
const kGreen     = Color(0xFF2E7D32);
const kGreenBg   = Color(0xFFE8F5E9);
const kBg        = Color(0xFFF0F4FF);

class AfyaApp extends StatelessWidget {
  const AfyaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AfyaTanzania',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kBlue,
          primary: kBlue,
          secondary: kGreen,
        ),
        scaffoldBackgroundColor: kBg,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: kBlueDark,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const MainNavigationController(),
    );
  }
}

// ─────────────────────────── MODELS ───────────────────────────
class Doctor {
  final int id;
  final String name;
  final String specialty;
  final double rating;
  final String region;
  final String city;
  final String district;
  final String hospital;
  final String imageUrl;
  final bool available;
  final String fee;
  final String experience;
  final String languages;
  final String about;

  const Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.region,
    required this.city,
    required this.district,
    required this.hospital,
    required this.imageUrl,
    required this.fee,
    required this.experience,
    required this.languages,
    required this.about,
    this.available = true,
  });
}

class Disease {
  final String name;
  final String icon;
  final String symptoms;
  final String prevention;
  final String treatment;
  final Color color;

  const Disease({
    required this.name,
    required this.icon,
    required this.symptoms,
    required this.prevention,
    required this.treatment,
    required this.color,
  });
}

class Pharmacy {
  final String name;
  final String distance;
  final String hours;
  final String phone;
  final bool isOpen;

  const Pharmacy({
    required this.name,
    required this.distance,
    required this.hours,
    required this.phone,
    required this.isOpen,
  });
}

class MedicalRecord {
  final String title;
  final String date;
  final String doctor;
  final String hospital;
  final String notes;
  final List<String> prescriptions;

  const MedicalRecord({
    required this.title,
    required this.date,
    required this.doctor,
    required this.hospital,
    required this.notes,
    required this.prescriptions,
  });
}

class Appointment {
  final Doctor doctor;
  final String date;
  final String time;
  final String type;
  final String status;

  const Appointment({
    required this.doctor,
    required this.date,
    required this.time,
    required this.type,
    required this.status,
  });
}

// ─────────────────────────── MOCK DATA ───────────────────────────
const List<Doctor> kDoctors = [
  Doctor(
    id: 1,
    name: "Dr. Nehemia Mwangosi",
    specialty: "Cardiologist",
    rating: 4.9,
    region: "Dar es Salaam",
    city: "Dar es Salaam",
    district: "Kinondoni",
    hospital: "Muhimbili National Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/1-min.jpeg?w=400",
    fee: "TZS 35,000",
    experience: "12 years",
    languages: "Swahili, English",
    about: "Expert cardiologist specialising in heart disease management and prevention. Trained at MUHAS with fellowship from Johns Hopkins.",
    available: true,
  ),
  Doctor(
    id: 2,
    name: "Dr. Gloria Ngajilo",
    specialty: "Pediatrician",
    rating: 4.8,
    region: "Arusha",
    city: "Arusha",
    district: "Arusha City",
    hospital: "Mount Meru Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/3-min.jpg?w=400",
    fee: "TZS 25,000",
    experience: "9 years",
    languages: "Swahili, English",
    about: "Child health specialist with a passion for preventive care. Expert in neonatal and childhood infections common in East Africa.",
    available: true,
  ),
  Doctor(
    id: 3,
    name: "Dr. Emmanuel Mwalumuli",
    specialty: "General Practitioner",
    rating: 4.7,
    region: "Mwanza",
    city: "Mwanza",
    district: "Nyamagana",
    hospital: "Bugando Medical Centre",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/2-min.jpeg?w=400",
    fee: "TZS 20,000",
    experience: "7 years",
    languages: "Swahili",
    about: "Committed primary care physician providing comprehensive healthcare to the Lake Zone community.",
    available: false,
  ),
  Doctor(
    id: 4,
    name: "Dr. Shija Kessy",
    specialty: "Dermatologist",
    rating: 4.6,
    region: "Dar es Salaam",
    city: "Dar es Salaam",
    district: "Ilala",
    hospital: "Aga Khan Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/4-min.jpeg?w=400",
    fee: "TZS 40,000",
    experience: "15 years",
    languages: "Swahili, English, Arabic",
    about: "Leading dermatologist specialising in tropical skin conditions, cosmetic procedures, and skin cancer screening.",
    available: true,
  ),
  Doctor(
    id: 5,
    name: "Dr. Grace Minja",
    specialty: "Gynecologist",
    rating: 4.9,
    region: "Dar es Salaam",
    city: "Dar es Salaam",
    district: "Temeke",
    hospital: "Temeke Regional Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/5-min.jpeg?w=400",
    fee: "TZS 30,000",
    experience: "11 years",
    languages: "Swahili, English",
    about: "Women's health champion offering comprehensive obstetric and gynaecological care with compassion and expertise.",
    available: true,
  ),
  Doctor(
    id: 6,
    name: "Dr. Omar Salim",
    specialty: "Orthopedist",
    rating: 4.5,
    region: "Zanzibar",
    city: "Zanzibar City",
    district: "Zanzibar City",
    hospital: "Mnazi Mmoja Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/6-min.jpeg?w=400",
    fee: "TZS 45,000",
    experience: "18 years",
    languages: "Swahili, English, Arabic",
    about: "Senior orthopaedic surgeon with expertise in joint replacement, sports injuries, and trauma surgery.",
    available: true,
  ),
  Doctor(
    id: 7,
    name: "Dr. Amina Rashid",
    specialty: "Neurologist",
    rating: 4.8,
    region: "Dodoma",
    city: "Dodoma",
    district: "Dodoma City",
    hospital: "Benjamin Mkapa Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/9-min.jpeg?w=400",
    fee: "TZS 50,000",
    experience: "14 years",
    languages: "Swahili, English",
    about: "Specialist in neurological disorders including stroke, epilepsy, and Parkinson's disease. Serves as lead neurologist at the capital hospital.",
    available: false,
  ),
  Doctor(
    id: 8,
    name: "Dr. Peter Kimaro",
    specialty: "Ophthalmologist",
    rating: 4.7,
    region: "Mbeya",
    city: "Mbeya",
    district: "Mbeya City",
    hospital: "Mbeya Referral Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/5-min.jpeg?w=400",
    fee: "TZS 30,000",
    experience: "10 years",
    languages: "Swahili",
    about: "Eye care specialist providing cataract surgery, vision correction, and diabetic eye disease management to Southern Highlands patients.",
    available: true,
  ),
  Doctor(
    id: 9,
    name: "Dr. Henry Humba",
    specialty: "Neurosurgeon",
    rating: 4.7,
    region: "Mbeya",
    city: "Mbeya",
    district: "Mbeya City",
    hospital: "Mbeya Referral Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/9-min.jpeg?w=400",
    fee: "TZS 30,000",
    experience: "10 years",
    languages: "Swahili",
    about: "Eye care specialist providing cataract surgery, vision correction, and diabetic eye disease management to Southern Highlands patients.",
    available: true,
  ),
  Doctor(
    id: 10,
    name: "Dr. Peter Kimaro",
    specialty: "Gynaecologist",
    rating: 4.7,
    region: "Mbeya",
    city: "Mbeya",
    district: "Mbeya City",
    hospital: "Mbeya Referral Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/10-min.jpg?w=400",
    fee: "TZS 30,000",
    experience: "10 years",
    languages: "Swahili",
    about: "Eye care specialist providing cataract surgery, vision correction, and diabetic eye disease management to Southern Highlands patients.",
    available: true,
  ),
  Doctor(
    id: 11,
    name: "Dr. Israel A. Soko",
    specialty: "Obstetrician",
    rating: 4.7,
    region: "Mbeya",
    city: "Mbeya",
    district: "Mbeya City",
    hospital: "Mbeya Referral Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/11-min.jpg?w=400",
    fee: "TZS 30,000",
    experience: "10 years",
    languages: "Swahili",
    about: "Eye care specialist providing cataract surgery, vision correction, and diabetic eye disease management to Southern Highlands patients.",
    available: true,
  ),
  Doctor(
    id: 12,
    name: "Dr. Nsubhis Mwakapeje",
    specialty: "General practitioner",
    rating: 4.7,
    region: "Mbeya",
    city: "Mbeya",
    district: "Mbeya City",
    hospital: "Mbeya Referral Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/12-min.jpg?w=400",
    fee: "TZS 30,000",
    experience: "10 years",
    languages: "Swahili",
    about: "Eye care specialist providing cataract surgery, vision correction, and diabetic eye disease management to Southern Highlands patients.",
    available: true,
  ),
  Doctor(
    id: 13,
    name: "Dr. Peter Kimaro",
    specialty: "Ophthalmologist",
    rating: 4.7,
    region: "Mbeya",
    city: "Mbeya",
    district: "Mbeya City",
    hospital: "Mbeya Referral Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/13-min.jpg?w=400",
    fee: "TZS 30,000",
    experience: "10 years",
    languages: "Swahili",
    about: "Eye care specialist providing cataract surgery, vision correction, and diabetic eye disease management to Southern Highlands patients.",
    available: true,
  ),
  Doctor(
    id: 14,
    name: "Dr. Furaha Malecela",
    specialty: "Dentist",
    rating: 4.7,
    region: "Mbeya",
    city: "Mbeya",
    district: "Mbeya City",
    hospital: "Mbeya Referral Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/14-min.jpg?w=400",
    fee: "TZS 30,000",
    experience: "10 years",
    languages: "Swahili",
    about: "Eye care specialist providing cataract surgery, vision correction, and diabetic eye disease management to Southern Highlands patients.",
    available: true,
  ),
  Doctor(
    id: 15,
    name: "Dr. Jacinta Feksi",
    specialty: "Ophthalmologist",
    rating: 4.7,
    region: "Mbeya",
    city: "Mbeya",
    district: "Mbeya City",
    hospital: "Mbeya Referral Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/15-min.jpg?w=400",
    fee: "TZS 30,000",
    experience: "10 years",
    languages: "Swahili",
    about: "Eye care specialist providing cataract surgery, vision correction, and diabetic eye disease management to Southern Highlands patients.",
    available: true,
  ),
  Doctor(
    id: 16,
    name: "Dr. John R. Meda",
    specialty: "Ophthalmologist",
    rating: 4.7,
    region: "Mbeya",
    city: "Mbeya",
    district: "Mbeya City",
    hospital: "Mbeya Referral Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/16-min.jpg?w=400",
    fee: "TZS 30,000",
    experience: "10 years",
    languages: "Swahili",
    about: "Eye care specialist providing cataract surgery, vision correction, and diabetic eye disease management to Southern Highlands patients.",
    available: true,
  ),
  Doctor(
    id: 17,
    name: "Dr. Venance Misago",
    specialty: "Ophthalmologist",
    rating: 4.7,
    region: "Mbeya",
    city: "Mbeya",
    district: "Mbeya City",
    hospital: "Mbeya Referral Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/17-min.jpg?w=400",
    fee: "TZS 30,000",
    experience: "10 years",
    languages: "Swahili",
    about: "Eye care specialist providing cataract surgery, vision correction, and diabetic eye disease management to Southern Highlands patients.",
    available: true,
  ),
  Doctor(
    id: 18,
    name: "Dr. Stellah Malangahe",
    specialty: "Ophthalmologist",
    rating: 4.7,
    region: "Mbeya",
    city: "Mbeya",
    district: "Mbeya City",
    hospital: "Mbeya Referral Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/18-min.jpg?w=400",
    fee: "TZS 30,000",
    experience: "10 years",
    languages: "Swahili",
    about: "Eye care specialist providing cataract surgery, vision correction, and diabetic eye disease management to Southern Highlands patients.",
    available: true,
  ),
  Doctor(
    id: 19,
    name: "Dr. Peter Kimaro",
    specialty: "Ophthalmologist",
    rating: 4.7,
    region: "Mbeya",
    city: "Mbeya",
    district: "Mbeya City",
    hospital: "Mbeya Referral Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/19-min.jpg?w=400",
    fee: "TZS 30,000",
    experience: "10 years",
    languages: "Swahili",
    about: "Eye care specialist providing cataract surgery, vision correction, and diabetic eye disease management to Southern Highlands patients.",
    available: true,
  ),
  Doctor(
    id: 20,
    name: "Dr. Peter Kimaro",
    specialty: "Ophthalmologist",
    rating: 4.7,
    region: "Mbeya",
    city: "Mbeya",
    district: "Mbeya City",
    hospital: "Mbeya Referral Hospital",
    imageUrl: "https://afya-profile-photo.s3.eu-north-1.amazonaws.com/profile-picture/20-min.jpg?w=400",
    fee: "TZS 30,000",
    experience: "10 years",
    languages: "Swahili",
    about: "Eye care specialist providing cataract surgery, vision correction, and diabetic eye disease management to Southern Highlands patients.",
    available: true,
  ),
];

const List<Disease> kDiseases = [
  Disease(
    name: "Malaria",
    icon: "🦟",
    symptoms: "Fever, Chills, Headache, Sweating, Muscle pain, Nausea, Fatigue",
    prevention: "Sleep under insecticide-treated nets, use mosquito repellent, take antimalarial prophylaxis when travelling, eliminate standing water near homes.",
    treatment: "ACT (Artemisinin-based Combination Therapy) e.g. Artemether-Lumefantrine. Seek medical care within 24 hours of symptom onset.",
    color: Color(0xFFE65100),
  ),
  Disease(
    name: "Typhoid Fever",
    icon: "🦠",
    symptoms: "Sustained high fever (39–40°C), Weakness, Abdominal pain, Headache, Rose-coloured spots, Loss of appetite",
    prevention: "Drink only clean boiled water, vaccinate with Vi polysaccharide vaccine, wash hands thoroughly, eat well-cooked food.",
    treatment: "Antibiotics: Ciprofloxacin or Azithromycin. Rest and adequate hydration. Hospitalisation for severe cases.",
    color: Color(0xFFB71C1C),
  ),
  Disease(
    name: "HIV/AIDS",
    icon: "🔴",
    symptoms: "Flu-like illness initially, then weight loss, recurring infections, oral thrush, night sweats, swollen lymph nodes",
    prevention: "Consistent condom use, PrEP (Pre-Exposure Prophylaxis), sterile needle use, PMTCT programmes, regular testing.",
    treatment: "Antiretroviral Therapy (ART) — taken daily, lifelong. Early treatment maintains quality of life and prevents transmission.",
    color: Color(0xFF880E4F),
  ),
  Disease(
    name: "Cholera",
    icon: "💧",
    symptoms: "Sudden watery diarrhoea (rice-water stools), Vomiting, Rapid dehydration, Muscle cramps, Sunken eyes",
    prevention: "Drink safe clean water, oral cholera vaccine, thorough handwashing, proper sanitation and waste disposal.",
    treatment: "Immediate ORS (Oral Rehydration Salts), IV fluids for severe cases, antibiotics (Doxycycline or Azithromycin).",
    color: Color(0xFF1565C0),
  ),
  Disease(
    name: "Tuberculosis (TB)",
    icon: "🫁",
    symptoms: "Persistent cough (>2 weeks), Blood in sputum, Night sweats, Unexplained weight loss, Chest pain, Fatigue",
    prevention: "BCG vaccination at birth, proper ventilation in living spaces, treating active TB cases, nutritious diet.",
    treatment: "6-month DOTS regimen: Rifampicin, Isoniazid, Pyrazinamide, Ethambutol. Never stop medication early.",
    color: Color(0xFF2E7D32),
  ),
  Disease(
    name: "Hypertension",
    icon: "❤️",
    symptoms: "Often silent — may include headaches, dizziness, blurred vision, chest pain, shortness of breath",
    prevention: "Reduce salt intake, exercise regularly, maintain healthy weight, avoid alcohol and smoking, manage stress.",
    treatment: "Lifestyle changes plus medications: Amlodipine, Hydrochlorothiazide, Enalapril. Regular BP monitoring.",
    color: Color(0xFFC62828),
  ),
];

const List<Pharmacy> kPharmacies = [
  Pharmacy(name: "Afya Dawa Pharmacy", distance: "0.3 km", hours: "Open 24 hours", phone: "+255 22 215 0001", isOpen: true),
  Pharmacy(name: "Tunza Pharmacy", distance: "0.6 km", hours: "Closes 9:00 PM", phone: "+255 22 215 0042", isOpen: true),
  Pharmacy(name: "MedPlus Pharmacy", distance: "1.1 km", hours: "Closes 8:00 PM", phone: "+255 787 123 456", isOpen: true),
  Pharmacy(name: "Karibu Dawa Store", distance: "1.4 km", hours: "Closes 10:00 PM", phone: "+255 713 987 654", isOpen: true),
  Pharmacy(name: "National Pharmacy", distance: "2.0 km", hours: "Opens 8:00 AM", phone: "+255 22 215 0088", isOpen: false),
  Pharmacy(name: "City Chemist DSM", distance: "2.3 km", hours: "Closes 9:00 PM", phone: "+255 754 321 000", isOpen: true),
];

final List<MedicalRecord> kRecords = [
  const MedicalRecord(
    title: "General Checkup",
    date: "15 Mar 2025",
    doctor: "Dr. Faraja Shayo",
    hospital: "Bugando Medical Centre",
    notes: "BP: 120/80 mmHg (Normal). Mild anaemia detected — Hb 10.2 g/dL. Advised dietary changes and iron supplementation. Follow-up in 4 weeks.",
    prescriptions: ["Ferrous Sulfate 200mg – Once daily", "Vitamin C 500mg – Once daily", "Folic Acid 5mg – Once daily"],
  ),
  const MedicalRecord(
    title: "Malaria Treatment",
    date: "02 Jan 2025",
    doctor: "Dr. Juma Kapuya",
    hospital: "Mount Meru Hospital",
    notes: "RDT Positive for P. falciparum malaria. Temperature 38.9°C. Started 3-day ACT course. Advised rest, fluids, and follow-up if no improvement.",
    prescriptions: ["Artemether-Lumefantrine – Twice daily for 3 days", "Paracetamol 500mg – Every 6 hours PRN", "ORS sachets – As needed"],
  ),
  const MedicalRecord(
    title: "Cardiac Consultation",
    date: "20 Nov 2024",
    doctor: "Dr. Neema Mollel",
    hospital: "Muhimbili National Hospital",
    notes: "ECG normal sinus rhythm. Mild Stage 1 hypertension. Cholesterol slightly elevated. Lifestyle changes recommended: reduce salt, exercise 30min/day. Monitor BP weekly.",
    prescriptions: ["Amlodipine 5mg – Once daily", "Aspirin 75mg – Once daily"],
  ),
];

final List<Appointment> kUpcomingAppts = [
  Appointment(
    doctor: kDoctors[0],
    date: "Thu, 3 Apr 2025",
    time: "10:00 AM",
    type: "Video Consultation",
    status: "Confirmed",
  ),
  Appointment(
    doctor: kDoctors[4],
    date: "Mon, 7 Apr 2025",
    time: "2:30 PM",
    type: "In-Person Visit",
    status: "Pending",
  ),
];

final List<Appointment> kPastAppts = [
  Appointment(doctor: kDoctors[1], date: "15 Mar 2025", time: "9:00 AM", type: "Video Consultation", status: "Completed"),
  Appointment(doctor: kDoctors[2], date: "02 Jan 2025", time: "11:00 AM", type: "In-Person Visit", status: "Completed"),
  Appointment(doctor: kDoctors[0], date: "20 Nov 2024", time: "3:00 PM", type: "Video Consultation", status: "Completed"),
];

const List<String> kSpecialties = [
  "Cardiologist", "Pediatrician", "General Practitioner",
  "Dermatologist", "Gynecologist", "Orthopedist", "Neurologist", "Ophthalmologist",
];

const Map<String, String> kSpecialtyIcons = {
  "Cardiologist": "❤️", "Pediatrician": "👶", "General Practitioner": "🩺",
  "Dermatologist": "🧴", "Gynecologist": "👩", "Orthopedist": "🦴",
  "Neurologist": "🧠", "Ophthalmologist": "👁️",
};

const List<String> kRegions = [
  "All", "Dar es Salaam", "Arusha", "Mwanza", "Dodoma", "Mbeya", "Tanga", "Zanzibar",
];

const List<String> kSymptoms = [
  "Fever", "Headache", "Cough", "Chest Pain", "Fatigue",
  "Nausea", "Vomiting", "Diarrhoea", "Sore Throat", "Body Aches",
  "Rash", "Dizziness", "Shortness of Breath", "Joint Pain",
  "Abdominal Pain", "Loss of Appetite", "Night Sweats", "Weight Loss",
];

// ─────────────────────────── SHARED WIDGETS ───────────────────────────
class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;
  const SectionHeader({super.key, required this.title, this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 16, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          if (onSeeAll != null)
            TextButton(onPressed: onSeeAll, child: const Text("See all", style: TextStyle(color: kBlue, fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }
}

class AvailabilityBadge extends StatelessWidget {
  final bool available;
  const AvailabilityBadge({super.key, required this.available});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: available ? kGreenBg : const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        available ? "Available" : "Busy",
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: available ? kGreen : Colors.orange.shade800,
        ),
      ),
    );
  }
}

Widget buildDoctorAvatar(String url, {double size = 64, double radius = 14}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: Image.network(
      url,
      width: size,
      height: size,
      fit: BoxFit.cover,
      loadingBuilder: (_, child, progress) =>
          progress == null ? child : Container(width: size, height: size, color: kBlueLight, child: const Center(child: CircularProgressIndicator(strokeWidth: 2))),
      errorBuilder: (_, __, ___) => Container(width: size, height: size, color: kBlueLight, child: const Icon(Icons.person, color: kBlue)),
    ),
  );
}

// ─────────────────────────── MAIN NAV ───────────────────────────
class MainNavigationController extends StatefulWidget {
  const MainNavigationController({super.key});

  @override
  State<MainNavigationController> createState() => _MainNavigationControllerState();
}

class _MainNavigationControllerState extends State<MainNavigationController> {
  int _selectedIndex = 0;

  late final List<Widget> _screens = [
    HomeScreen(onNavigate: (i) => setState(() => _selectedIndex = i)),
    const DoctorSearchScreen(),
    const AppointmentsScreen(),
    const RecordsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: kBlueLight,
        onDestinationSelected: (i) => setState(() => _selectedIndex = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home, color: kBlue), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), selectedIcon: Icon(Icons.search, color: kBlue), label: 'Find'),
          NavigationDestination(icon: Icon(Icons.calendar_month_outlined), selectedIcon: Icon(Icons.calendar_month, color: kBlue), label: 'Bookings'),
          NavigationDestination(icon: Icon(Icons.folder_outlined), selectedIcon: Icon(Icons.folder, color: kBlue), label: 'Records'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person, color: kBlue), label: 'Profile'),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//                        HOME SCREEN
// ═══════════════════════════════════════════════════════════════
class HomeScreen extends StatelessWidget {
  final ValueChanged<int> onNavigate;
  const HomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final topDocs = [...kDoctors]..sort((a, b) => b.rating.compareTo(a.rating));

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHero(context),
          _buildQuickActions(context),
          SectionHeader(title: "⭐ Top Rated Doctors", onSeeAll: () => onNavigate(1)),
          _buildDoctorCarousel(context, topDocs.take(5).toList()),
          _buildSymptomBanner(context),
          SectionHeader(title: "🏥 Browse Specialties", onSeeAll: () => onNavigate(1)),
          _buildSpecialtiesGrid(context),
          SectionHeader(title: "📚 Disease Library"),
          _buildDiseaseList(context),
          SectionHeader(title: "🕐 Recent Consultations"),
          _buildRecentConsultations(context),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // ── Hero header ──
  Widget _buildHero(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 56, 20, 28),
      decoration: const BoxDecoration(
        color: kBlueDark,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Habari, Ridhiwani 👋", style: TextStyle(color: Colors.white70, fontSize: 14)),
                  SizedBox(height: 2),
                  Text("Find Your Doctor", style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold)),
                ],
              ),
              InkWell(
                onTap: () => _showNotifications(context),
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), shape: BoxShape.circle),
                      child: const Icon(Icons.notifications_none, color: Colors.white, size: 22),
                    ),
                    Positioned(
                      top: 6, right: 6,
                      child: Container(
                        width: 9, height: 9,
                        decoration: BoxDecoration(color: Colors.amber, shape: BoxShape.circle, border: Border.all(color: kBlueDark, width: 1.5)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DoctorSearchScreen())),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.white60, size: 20),
                  SizedBox(width: 10),
                  Text("Search symptoms, doctors, hospitals...", style: TextStyle(color: Colors.white60, fontSize: 14)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Quick actions ──
  Widget _buildQuickActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _qaItem(context, Icons.videocam_rounded, "Video Call", const Color(0xFF1565C0), const Color(0xFFE3EDFF),
              () => Navigator.push(context, MaterialPageRoute(builder: (_) => VideoCallView(doctor: kDoctors[0])))),
          _qaItem(context, Icons.person_search, "Doctors", kGreen, kGreenBg,
              () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DoctorSearchScreen()))),
          _qaItem(context, Icons.local_pharmacy_outlined, "Pharmacy", Colors.orange.shade700, const Color(0xFFFFF3E0),
              () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PharmacyScreen()))),
          _qaItem(context, Icons.help_outline_rounded, "Support", Colors.purple.shade700, const Color(0xFFF3E5F5),
              () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpCenterScreen()))),
        ],
      ),
    );
  }

  Widget _qaItem(BuildContext context, IconData icon, String label, Color iconColor, Color bg, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60, height: 60,
            decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(18)),
            child: Icon(icon, color: iconColor, size: 26),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  // ── Doctor carousel ──
  Widget _buildDoctorCarousel(BuildContext context, List<Doctor> docs) {
    return SizedBox(
      height: 190,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: docs.length,
        itemBuilder: (context, i) {
          final doc = docs[i];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DoctorDetailView(doctor: doc))),
            child: Container(
              width: 150,
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade100),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(doc.imageUrl, height: 84, width: double.infinity, fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(height: 84, color: kBlueLight, child: const Icon(Icons.person, color: kBlue, size: 36))),
                  ),
                  const SizedBox(height: 8),
                  Text(doc.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text(doc.specialty, style: const TextStyle(color: kBlue, fontSize: 10, fontWeight: FontWeight.w600)),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        const Icon(Icons.star, color: Colors.orange, size: 13),
                        Text(" ${doc.rating}", style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                      ]),
                      AvailabilityBadge(available: doc.available),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ── Symptom banner ──
  Widget _buildSymptomBanner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SymptomCheckerView())),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.green.shade700, Colors.green.shade500]),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Symptom Checker", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("Check your symptoms and get an AI-powered diagnosis suggestion", style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.4)),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: const Text("Start", style: TextStyle(color: kGreen, fontWeight: FontWeight.bold, fontSize: 13)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Specialties ──
  Widget _buildSpecialtiesGrid(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: kSpecialties.length,
        itemBuilder: (context, i) {
          final spec = kSpecialties[i];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DoctorSearchScreen(initialSpecialty: spec)),
            ),
            child: Container(
              width: 90,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade100)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(kSpecialtyIcons[spec] ?? "🩺", style: const TextStyle(fontSize: 26)),
                  const SizedBox(height: 6),
                  Text(spec, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w600), textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ── Disease list ──
  Widget _buildDiseaseList(BuildContext context) {
    return Column(
      children: kDiseases.take(4).map((d) => GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DiseaseDetailView(disease: d))),
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 8),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Row(
            children: [
              Container(
                width: 44, height: 44,
                decoration: BoxDecoration(color: d.color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                child: Center(child: Text(d.icon, style: const TextStyle(fontSize: 22))),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(d.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(height: 2),
                    Text(d.symptoms.split(",").first.trim(), style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      )).toList(),
    );
  }

  // ── Recent consultations ──
  Widget _buildRecentConsultations(BuildContext context) {
    return Column(
      children: kPastAppts.take(2).map((a) => Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade100),
        ),
        child: Row(
          children: [
            buildDoctorAvatar(a.doctor.imageUrl, size: 48, radius: 12),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(a.doctor.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  Text(a.type, style: const TextStyle(color: kBlue, fontSize: 11, fontWeight: FontWeight.w600)),
                  Text(a.date, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: kGreenBg, borderRadius: BorderRadius.circular(8)),
              child: const Text("Done", style: TextStyle(color: kGreen, fontSize: 11, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      )).toList(),
    );
  }

  void _showNotifications(BuildContext context) {
    final notifs = [
      ("Reminder: Appointment with Dr. Neema Mollel tomorrow at 10:00 AM", "1h ago", kBlue),
      ("Your prescription is ready — Ferrous Sulfate 200mg", "3h ago", kGreen),
      ("Payment of TZS 35,000 confirmed for video consultation", "Yesterday", Colors.green),
      ("New message from Dr. Juma Kapuya in your consultation chat", "2 days ago", Colors.orange),
    ];
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
      builder: (_) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Notifications", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            ...notifs.map((n) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 9, height: 9, margin: const EdgeInsets.only(top: 5), decoration: BoxDecoration(color: n.$3, shape: BoxShape.circle)),
                  const SizedBox(width: 12),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(n.$1, style: const TextStyle(fontSize: 13, height: 1.4)),
                      const SizedBox(height: 2),
                      Text(n.$2, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                    ],
                  )),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//                     DOCTOR SEARCH SCREEN
// ═══════════════════════════════════════════════════════════════
class DoctorSearchScreen extends StatefulWidget {
  final String? initialSpecialty;
  const DoctorSearchScreen({super.key, this.initialSpecialty});

  @override
  State<DoctorSearchScreen> createState() => _DoctorSearchScreenState();
}

class _DoctorSearchScreenState extends State<DoctorSearchScreen> {
  String _region = "All";
  String _specialty = "";
  String _query = "";
  final _ctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialSpecialty != null) _specialty = widget.initialSpecialty!;
  }

  List<Doctor> get _filtered => kDoctors.where((d) {
    final matchQ = _query.isEmpty ||
        d.name.toLowerCase().contains(_query.toLowerCase()) ||
        d.specialty.toLowerCase().contains(_query.toLowerCase()) ||
        d.hospital.toLowerCase().contains(_query.toLowerCase());
    final matchR = _region == "All" || d.region == _region;
    final matchS = _specialty.isEmpty || d.specialty == _specialty;
    return matchQ && matchR && matchS;
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            color: kBlueDark,
            padding: const EdgeInsets.fromLTRB(16, 52, 16, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Find a Doctor", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                // Search bar
                Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
                  child: TextField(
                    controller: _ctrl,
                    onChanged: (v) => setState(() => _query = v),
                    decoration: const InputDecoration(
                      hintText: "Name, specialty, hospital…",
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Specialty chips
                SizedBox(
                  height: 36,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _specChip("All"),
                      ...kSpecialties.map(_specChip),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Region + district filters
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                const Icon(Icons.location_on, color: kBlue, size: 18),
                const SizedBox(width: 6),
                const Text("Region:", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 32,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: kRegions.map((r) => Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: GestureDetector(
                          onTap: () => setState(() => _region = r),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: _region == r ? kBlue : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(r, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: _region == r ? Colors.white : Colors.black87)),
                          ),
                        ),
                      )).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Results
          Expanded(
            child: _filtered.isEmpty
                ? const Center(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.search_off, size: 60, color: Colors.grey),
                      SizedBox(height: 12),
                      Text("No doctors found", style: TextStyle(color: Colors.grey, fontSize: 16)),
                    ],
                  ))
                : ListView.builder(
                    padding: const EdgeInsets.all(14),
                    itemCount: _filtered.length,
                    itemBuilder: (context, i) => _doctorCard(context, _filtered[i]),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _specChip(String s) {
    final active = s == "All" ? _specialty.isEmpty : _specialty == s;
    return GestureDetector(
      onTap: () => setState(() => _specialty = s == "All" ? "" : s),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: active ? Colors.transparent : Colors.white.withOpacity(0.3)),
        ),
        child: Text(s == "All" ? "All" : "${kSpecialtyIcons[s] ?? ''} $s",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: active ? kBlue : Colors.white70)),
      ),
    );
  }

  Widget _doctorCard(BuildContext context, Doctor doc) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DoctorDetailView(doctor: doc))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
        ),
        child: Row(
          children: [
            buildDoctorAvatar(doc.imageUrl, size: 72, radius: 14),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doc.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(doc.specialty, style: const TextStyle(color: kBlue, fontWeight: FontWeight.w600, fontSize: 12)),
                  const SizedBox(height: 4),
                  Row(children: [
                    const Icon(Icons.location_on, size: 12, color: Colors.grey),
                    const SizedBox(width: 2),
                    Expanded(child: Text("${doc.hospital}", style: const TextStyle(color: Colors.grey, fontSize: 11), overflow: TextOverflow.ellipsis)),
                  ]),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      AvailabilityBadge(available: doc.available),
                      const SizedBox(width: 8),
                      const Icon(Icons.star, color: Colors.orange, size: 13),
                      Text(" ${doc.rating}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Text(doc.fee, style: const TextStyle(color: kBlue, fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
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

// ═══════════════════════════════════════════════════════════════
//                   DOCTOR DETAIL & BOOKING
// ═══════════════════════════════════════════════════════════════
class DoctorDetailView extends StatefulWidget {
  final Doctor doctor;
  const DoctorDetailView({super.key, required this.doctor});

  @override
  State<DoctorDetailView> createState() => _DoctorDetailViewState();
}

class _DoctorDetailViewState extends State<DoctorDetailView> {
  int _selectedDayIndex = 0;
  String? _selectedTime;
  int _consultType = 0; // 0=Video, 1=InPerson, 2=Phone

  final _days = List.generate(7, (i) {
    final d = DateTime.now().add(Duration(days: i));
    final names = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    return {"name": names[d.weekday % 7], "num": d.day.toString()};
  });

  final _times = ["08:00 AM", "09:00 AM", "10:00 AM", "11:00 AM", "02:00 PM", "03:00 PM", "04:00 PM", "05:00 PM"];
  final _busyTimes = {"11:00 AM", "03:00 PM"};

  List<String> get _consultLabels => ["Video Call", "In-Person", "Phone Call"];
  List<IconData> get _consultIcons => [Icons.videocam_rounded, Icons.local_hospital_outlined, Icons.phone_rounded];
  List<String> get _consultFees => [widget.doctor.fee, "TZS 15,000", "TZS 12,000"];

  @override
  Widget build(BuildContext context) {
    final doc = widget.doctor;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Hero image
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: kBlueDark,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                doc.imageUrl, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(color: kBlueDark, child: const Icon(Icons.person, color: Colors.white54, size: 80)),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Doctor info header
                Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(doc.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 2),
                                Text(doc.specialty, style: const TextStyle(color: kBlue, fontWeight: FontWeight.w600, fontSize: 14)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(12)),
                            child: Row(children: [
                              const Icon(Icons.star, color: Colors.orange, size: 16),
                              const SizedBox(width: 4),
                              Text(doc.rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            ]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(children: [
                        const Icon(Icons.location_on, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Expanded(child: Text("${doc.hospital} · ${doc.district}, ${doc.region}", style: const TextStyle(color: Colors.grey, fontSize: 12))),
                      ]),
                      const SizedBox(height: 14),
                      // Stats row
                      Row(
                        children: [
                          _statBadge(Icons.work_outline, doc.experience),
                          const SizedBox(width: 10),
                          _statBadge(Icons.language, doc.languages),
                          const SizedBox(width: 10),
                          AvailabilityBadge(available: doc.available),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // About
                _section("About Doctor", Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 4),
                  child: Text(doc.about, style: const TextStyle(color: Colors.grey, height: 1.6, fontSize: 13)),
                )),
                const SizedBox(height: 8),
                // Consultation type
                _section("Consultation Type", Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: List.generate(3, (i) => Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _consultType = i),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: _consultType == i ? kBlueLight : Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: _consultType == i ? kBlue : Colors.grey.shade200, width: _consultType == i ? 2 : 1),
                          ),
                          child: Column(
                            children: [
                              Icon(_consultIcons[i], color: _consultType == i ? kBlue : Colors.grey, size: 24),
                              const SizedBox(height: 6),
                              Text(_consultLabels[i], style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: _consultType == i ? kBlue : Colors.black87), textAlign: TextAlign.center),
                              const SizedBox(height: 2),
                              Text(_consultFees[i], style: TextStyle(fontSize: 10, color: _consultType == i ? kGreen : Colors.grey)),
                            ],
                          ),
                        ),
                      ),
                    )),
                  ),
                )),
                const SizedBox(height: 8),
                // Date picker
                _section("Select Date", Column(
                  children: [
                    SizedBox(
                      height: 74,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: _days.length,
                        itemBuilder: (_, i) {
                          final sel = _selectedDayIndex == i;
                          return GestureDetector(
                            onTap: () => setState(() { _selectedDayIndex = i; _selectedTime = null; }),
                            child: Container(
                              width: 52,
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                color: sel ? kBlue : Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: sel ? kBlue : Colors.grey.shade200),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(_days[i]["name"]!, style: TextStyle(fontSize: 11, color: sel ? Colors.white70 : Colors.grey, fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 4),
                                  Text(_days[i]["num"]!, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: sel ? Colors.white : Colors.black87)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )),
                const SizedBox(height: 8),
                // Time slots
                _section("Available Time Slots", Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    spacing: 8, runSpacing: 8,
                    children: _times.map((t) {
                      final busy = _busyTimes.contains(t);
                      final sel = _selectedTime == t;
                      return GestureDetector(
                        onTap: busy ? null : () => setState(() => _selectedTime = t),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: busy ? Colors.grey.shade100 : sel ? kBlue : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: busy ? Colors.grey.shade200 : sel ? kBlue : Colors.grey.shade300),
                          ),
                          child: Text(
                            busy ? "$t (Full)" : t,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: busy ? Colors.grey : sel ? Colors.white : Colors.black87,
                              decoration: busy ? TextDecoration.lineThrough : null,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )),
                const SizedBox(height: 20),
                // Doctor's shift schedule
                _section("Doctor's Shift Schedule", Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(color: kBlueLight, borderRadius: BorderRadius.circular(14)),
                    child: Column(
                      children: [
                        _shiftRow("Monday – Friday", "8:00 AM – 5:00 PM"),
                        _shiftRow("Saturday", "9:00 AM – 1:00 PM"),
                        _shiftRow("Sunday", "Emergency only"),
                      ],
                    ),
                  ),
                )),
                const SizedBox(height: 24),
                // Book button
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kBlue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () {
                        if (_selectedTime == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please select a time slot"), backgroundColor: Colors.orange),
                          );
                          return;
                        }
                        Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentScreen(
                          doctor: widget.doctor,
                          consultType: _consultLabels[_consultType],
                          fee: _consultFees[_consultType],
                          date: "${_days[_selectedDayIndex]["name"]}, ${_days[_selectedDayIndex]["num"]}",
                          time: _selectedTime!,
                        )));
                      },
                      child: Text("Confirm Booking · ${_consultFees[_consultType]}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(String title, Widget child) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          child,
        ],
      ),
    );
  }

  Widget _statBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: kBg, borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        Icon(icon, size: 13, color: kBlue),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
      ]),
    );
  }

  Widget _shiftRow(String day, String hours) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          Text(hours, style: const TextStyle(fontSize: 12, color: kBlue, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//                      PAYMENT SCREEN
// ═══════════════════════════════════════════════════════════════
class PaymentScreen extends StatefulWidget {
  final Doctor doctor;
  final String consultType;
  final String fee;
  final String date;
  final String time;
  const PaymentScreen({super.key, required this.doctor, required this.consultType, required this.fee, required this.date, required this.time});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedMethod = 0;
  final List<String> _pin = [];
  bool _processing = false;

  final _methods = [
    {"name": "M-Pesa", "sub": "Vodacom Tanzania", "color": 0xFFE53935, "logo": "M"},
    {"name": "Tigo Pesa", "sub": "Tigo Tanzania", "color": 0xFF0D47A1, "logo": "T"},
    {"name": "Airtel Money", "sub": "Airtel Tanzania", "color": 0xFFE65100, "logo": "A"},
    {"name": "Bank Card", "sub": "Visa / Mastercard", "color": 0xFF37474F, "logo": "💳"},
  ];

  void _pressPin(String key) {
    setState(() {
      if (key == "⌫") {
        if (_pin.isNotEmpty) _pin.removeLast();
      } else if (_pin.length < 5) {
        _pin.add(key);
      }
    });
  }

  void _pay() async {
    if (_pin.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter your PIN"), backgroundColor: Colors.orange));
      return;
    }
    setState(() => _processing = true);
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() => _processing = false);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BookingSuccessScreen(
      doctor: widget.doctor,
      consultType: widget.consultType,
      date: widget.date,
      time: widget.time,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Secure Payment")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.grey.shade100)),
              child: Column(
                children: [
                  _sumRow("Doctor", widget.doctor.name),
                  _sumRow("Speciality", widget.doctor.specialty),
                  _sumRow("Type", widget.consultType),
                  _sumRow("Date & Time", "${widget.date} · ${widget.time}"),
                  _sumRow("Platform Fee", "TZS 2,000"),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Amount", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(widget.fee, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: kBlue)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Payment Method", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ..._methods.asMap().entries.map((e) {
              final i = e.key; final m = e.value; final active = _selectedMethod == i;
              return GestureDetector(
                onTap: () => setState(() => _selectedMethod = i),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: active ? kBlueLight : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: active ? kBlue : Colors.grey.shade200, width: active ? 2 : 1),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 44, height: 44,
                        decoration: BoxDecoration(color: Color(m["color"] as int), borderRadius: BorderRadius.circular(12)),
                        child: Center(child: Text(m["logo"] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
                      ),
                      const SizedBox(width: 14),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(m["name"] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        Text(m["sub"] as String, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      ])),
                      Icon(active ? Icons.radio_button_checked : Icons.radio_button_off, color: active ? kBlue : Colors.grey),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 16),
            const Text("Enter PIN", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            // PIN dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) => Container(
                width: 54, height: 54,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: i < _pin.length ? kBlueLight : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: i < _pin.length ? kBlue : Colors.grey.shade300, width: i < _pin.length ? 2 : 1),
                ),
                child: Center(child: Text(i < _pin.length ? "●" : "", style: const TextStyle(fontSize: 22, color: kBlue))),
              )),
            ),
            const SizedBox(height: 14),
            // Numpad
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 2.0,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: ["1","2","3","4","5","6","7","8","9","","0","⌫"].map((k) {
                if (k.isEmpty) return const SizedBox();
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    elevation: 0,
                    side: BorderSide(color: Colors.grey.shade200),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => _pressPin(k),
                  child: Text(k, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: _processing ? null : _pay,
                child: _processing
                    ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : Text("Pay ${widget.fee} & Confirm", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.lock, size: 14, color: Colors.grey),
                SizedBox(width: 4),
                Text("Secured by 256-bit SSL encryption", style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _sumRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//                    BOOKING SUCCESS SCREEN
// ═══════════════════════════════════════════════════════════════
class BookingSuccessScreen extends StatelessWidget {
  final Doctor doctor;
  final String consultType;
  final String date;
  final String time;
  const BookingSuccessScreen({super.key, required this.doctor, required this.consultType, required this.date, required this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 90, height: 90,
                decoration: const BoxDecoration(color: kGreenBg, shape: BoxShape.circle),
                child: const Icon(Icons.check_circle_rounded, color: kGreen, size: 52),
              ),
              const SizedBox(height: 20),
              const Text("Booking Confirmed!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text("Your appointment with ${doctor.name}\n$consultType on $date at $time\nhas been successfully confirmed.",
                  textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey, height: 1.6, fontSize: 14)),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: kBg, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    _detailRow(Icons.person, "Doctor", doctor.name),
                    _detailRow(Icons.videocam_outlined, "Type", consultType),
                    _detailRow(Icons.calendar_today, "Date", date),
                    _detailRow(Icons.access_time, "Time", time),
                    _detailRow(Icons.location_on_outlined, "Hospital", doctor.hospital),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: kBlue, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), padding: const EdgeInsets.symmetric(vertical: 16)),
                  onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
                  child: const Text("Back to Home", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 12),
              if (consultType.contains("Video"))
                OutlinedButton(
                  style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), padding: const EdgeInsets.symmetric(vertical: 16), minimumSize: const Size(double.infinity, 0)),
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => VideoCallView(doctor: doctor))),
                  child: const Text("Join Video Call Now", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        Icon(icon, size: 16, color: kBlue),
        const SizedBox(width: 10),
        Text("$label: ", style: const TextStyle(color: Colors.grey, fontSize: 13)),
        Expanded(child: Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13), overflow: TextOverflow.ellipsis)),
      ]),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//                    VIDEO CALL SCREEN
// ═══════════════════════════════════════════════════════════════
class VideoCallView extends StatefulWidget {
  final Doctor doctor;
  const VideoCallView({super.key, required this.doctor});

  @override
  State<VideoCallView> createState() => _VideoCallViewState();
}

class _VideoCallViewState extends State<VideoCallView> {
  int _seconds = 0;
  Timer? _timer;
  bool _micOn = true;
  bool _camOn = true;
  bool _chatOpen = false;
  final _chatCtrl = TextEditingController();
  final _chatScrollCtrl = ScrollController();
  final List<Map<String, dynamic>> _messages = [
    {"sender": "Doctor", "text": "Good morning! How are you feeling today?", "mine": false},
    {"sender": "You", "text": "Good morning Doctor. I have been having chest tightness since yesterday.", "mine": true},
    {"sender": "Doctor", "text": "I see. Can you describe the tightness — is it constant or intermittent?", "mine": false},
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => setState(() => _seconds++));
  }

  @override
  void dispose() {
    _timer?.cancel();
    _chatCtrl.dispose();
    _chatScrollCtrl.dispose();
    super.dispose();
  }

  String get _formattedTime {
    final m = _seconds ~/ 60;
    final s = _seconds % 60;
    return "${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
  }

  void _sendMessage() {
    if (_chatCtrl.text.trim().isEmpty) return;
    setState(() {
      _messages.add({"sender": "You", "text": _chatCtrl.text.trim(), "mine": true});
      _chatCtrl.clear();
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_chatScrollCtrl.hasClients) _chatScrollCtrl.jumpTo(_chatScrollCtrl.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Doctor video (simulated)
          Positioned.fill(
            child: Image.network(
              widget.doctor.imageUrl,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.35),
              colorBlendMode: BlendMode.darken,
              errorBuilder: (_, __, ___) => Container(
                color: const Color(0xFF0D1B2A),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person, color: Colors.white30, size: 100),
                    const SizedBox(height: 12),
                    Text(widget.doctor.name, style: const TextStyle(color: Colors.white60, fontSize: 18)),
                  ],
                ),
              ),
            ),
          ),

          // Top bar: timer + connection + chat toggle
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Timer + status
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(20)),
                        child: Row(children: [
                          Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.greenAccent, shape: BoxShape.circle)),
                          const SizedBox(width: 8),
                          Text(_formattedTime, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                        ]),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(12)),
                        child: const Text("HD · Connected", style: TextStyle(color: Colors.greenAccent, fontSize: 11, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  // Chat button
                  GestureDetector(
                    onTap: () => setState(() => _chatOpen = !_chatOpen),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: _chatOpen ? kBlue : Colors.black54,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 22),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Doctor name overlay
          Positioned(
            top: 120,
            left: 0, right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(20)),
                child: Text(widget.doctor.name, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ),

          // Patient PiP
          Positioned(
            bottom: 130, right: 16,
            child: Container(
              width: 100, height: 148,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white30, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(_camOn ? Icons.person : Icons.videocam_off, color: Colors.white30, size: 36),
                  const SizedBox(height: 6),
                  const Text("You", style: TextStyle(color: Colors.white38, fontSize: 11)),
                ],
              ),
            ),
          ),

          // Chat panel
          if (_chatOpen)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.75),
                child: Column(
                  children: [
                    const SizedBox(height: 90),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Chat", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                          GestureDetector(onTap: () => setState(() => _chatOpen = false),
                              child: const Icon(Icons.close, color: Colors.white60)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: _chatScrollCtrl,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: _messages.length,
                        itemBuilder: (_, i) {
                          final m = _messages[i];
                          return Align(
                            alignment: (m["mine"] as bool) ? Alignment.centerRight : Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(12),
                              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.72),
                              decoration: BoxDecoration(
                                color: (m["mine"] as bool) ? kBlue : Colors.white12,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(m["sender"] as String, style: const TextStyle(color: Colors.white54, fontSize: 10)),
                                  const SizedBox(height: 3),
                                  Text(m["text"] as String, style: const TextStyle(color: Colors.white, fontSize: 13, height: 1.4)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _chatCtrl,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Type a message…",
                                hintStyle: const TextStyle(color: Colors.white38),
                                filled: true,
                                fillColor: Colors.white12,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(22), borderSide: BorderSide.none),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              onSubmitted: (_) => _sendMessage(),
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: _sendMessage,
                            child: Container(
                              width: 44, height: 44,
                              decoration: const BoxDecoration(color: kBlue, shape: BoxShape.circle),
                              child: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Controls bar
          Positioned(
            bottom: 0, left: 0, right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 36),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.85), Colors.transparent],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _controlBtn(
                    icon: _micOn ? Icons.mic : Icons.mic_off,
                    bg: _micOn ? Colors.white24 : Colors.white.withOpacity(0.08),
                    onTap: () => setState(() => _micOn = !_micOn),
                    label: _micOn ? "Mute" : "Unmute",
                  ),
                  _controlBtn(
                    icon: Icons.call_end_rounded,
                    bg: Colors.red,
                    size: 64,
                    onTap: () => Navigator.pop(context),
                    label: "End",
                  ),
                  _controlBtn(
                    icon: _camOn ? Icons.videocam : Icons.videocam_off,
                    bg: _camOn ? Colors.white24 : Colors.white.withOpacity(0.08),
                    onTap: () => setState(() => _camOn = !_camOn),
                    label: _camOn ? "Camera" : "No Cam",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _controlBtn({required IconData icon, required Color bg, required VoidCallback onTap, required String label, double size = 52}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size, height: size,
            decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white, size: size * 0.42),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(color: Colors.white60, fontSize: 11)),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//                    APPOINTMENTS SCREEN
// ═══════════════════════════════════════════════════════════════
class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Appointments"),
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabCtrl,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          tabs: const [Tab(text: "Upcoming"), Tab(text: "Past"), Tab(text: "Prescriptions")],
        ),
      ),
      body: TabBarView(
        controller: _tabCtrl,
        children: [
          _upcomingTab(context),
          _pastTab(context),
          _prescriptionsTab(context),
        ],
      ),
    );
  }

  Widget _upcomingTab(BuildContext context) {
    if (kUpcomingAppts.isEmpty) {
      return const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.calendar_today_outlined, size: 60, color: Colors.grey),
        SizedBox(height: 12),
        Text("No upcoming appointments", style: TextStyle(color: Colors.grey)),
      ]));
    }
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Reminder banner
        Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: kBlueLight, borderRadius: BorderRadius.circular(14), border: Border.all(color: kBlue.withOpacity(0.3))),
          child: const Row(children: [
            Icon(Icons.notifications_active, color: kBlue, size: 20),
            SizedBox(width: 10),
            Expanded(child: Text("SMS reminders are ON. You'll receive a reminder 1 hour before each appointment.", style: TextStyle(fontSize: 12, color: kBlue, height: 1.4))),
          ]),
        ),
        ...kUpcomingAppts.map((a) => _apptCard(context, a, upcoming: true)),
      ],
    );
  }

  Widget _pastTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: kPastAppts.map((a) => _apptCard(context, a, upcoming: false)).toList(),
    );
  }

  Widget _prescriptionsTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: kRecords.map((r) => Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.grey.shade100)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(r.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Text(r.date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ]),
          const SizedBox(height: 4),
          Text(r.doctor, style: const TextStyle(color: kBlue, fontWeight: FontWeight.w600, fontSize: 12)),
          const Divider(height: 16),
          ...r.prescriptions.map((p) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(children: [
              const Icon(Icons.medication, size: 14, color: kGreen),
              const SizedBox(width: 8),
              Expanded(child: Text(p, style: const TextStyle(fontSize: 13))),
            ]),
          )),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              icon: const Icon(Icons.local_pharmacy_outlined, size: 16),
              label: const Text("Send to Pharmacy"),
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Prescription sent to nearest pharmacy!"), backgroundColor: kGreen)),
              style: OutlinedButton.styleFrom(foregroundColor: kGreen, side: const BorderSide(color: kGreen), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            ),
          ),
        ]),
      )).toList(),
    );
  }

  Widget _apptCard(BuildContext context, Appointment a, {required bool upcoming}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border(left: BorderSide(color: upcoming ? kBlue : Colors.grey.shade300, width: 4)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(children: [
          Row(children: [
            buildDoctorAvatar(a.doctor.imageUrl, size: 56, radius: 12),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(a.doctor.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Text(a.doctor.specialty, style: const TextStyle(color: kBlue, fontSize: 12, fontWeight: FontWeight.w600)),
            ])),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: a.status == "Confirmed" ? kGreenBg : a.status == "Completed" ? Colors.grey.shade100 : const Color(0xFFFFF3E0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(a.status, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold,
                  color: a.status == "Confirmed" ? kGreen : a.status == "Completed" ? Colors.grey : Colors.orange.shade800)),
            ),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            const Icon(Icons.calendar_today, size: 13, color: Colors.grey),
            const SizedBox(width: 6),
            Text("${a.date} · ${a.time}", style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const Spacer(),
            const Icon(Icons.videocam_outlined, size: 13, color: Colors.grey),
            const SizedBox(width: 4),
            Text(a.type, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            if (upcoming && a.type.contains("Video"))
              Expanded(child: ElevatedButton.icon(
                icon: const Icon(Icons.videocam_rounded, size: 16),
                label: const Text("Join Call"),
                style: ElevatedButton.styleFrom(backgroundColor: kBlue, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => VideoCallView(doctor: a.doctor))),
              )),
            if (upcoming && a.type.contains("Video")) const SizedBox(width: 8),
            Expanded(child: OutlinedButton(
              style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), side: BorderSide(color: Colors.grey.shade300)),
              onPressed: upcoming
                  ? () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Appointment rescheduled")))
                  : () => Navigator.push(context, MaterialPageRoute(builder: (_) => DoctorDetailView(doctor: a.doctor))),
              child: Text(upcoming ? "Reschedule" : "Rebook", style: const TextStyle(fontSize: 13)),
            )),
            if (upcoming) ...[
              const SizedBox(width: 8),
              OutlinedButton(
                style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), side: const BorderSide(color: Colors.red)),
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Appointment cancelled"), backgroundColor: Colors.red)),
                child: const Text("Cancel", style: TextStyle(color: Colors.red, fontSize: 13)),
              ),
            ],
          ]),
        ]),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//                    MEDICAL RECORDS SCREEN
// ═══════════════════════════════════════════════════════════════
class RecordsScreen extends StatelessWidget {
  const RecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Medical Records"), automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Patient card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [kBlueDark, kBlue]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 56, height: 56,
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                        child: const Icon(Icons.person, color: Colors.white, size: 30),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ridhiwani Kikwete", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                          Text("Patient ID: TZ-2024-004821", style: TextStyle(color: Colors.white70, fontSize: 12)),
                          Text("Blood Type: O+", style: TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _vitalStat("120/80", "Blood Pressure", "mmHg"),
                      Container(width: 1, height: 40, color: Colors.white24),
                      _vitalStat("72", "Heart Rate", "bpm"),
                      Container(width: 1, height: 40, color: Colors.white24),
                      _vitalStat("37.2°C", "Temperature", ""),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Allergies & conditions
            Row(children: [
              Expanded(child: _infoCard("⚠️ Allergies", ["Penicillin", "Sulfa drugs"], Colors.red.shade50, Colors.red)),
              const SizedBox(width: 10),
              Expanded(child: _infoCard("💊 Conditions", ["Mild Hypertension"], Colors.orange.shade50, Colors.orange.shade800)),
            ]),
            const SizedBox(height: 20),
            const Text("Visit History", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...kRecords.map((r) => _recordCard(r)),
          ],
        ),
      ),
    );
  }

  Widget _vitalStat(String value, String label, String unit) {
    return Column(children: [
      Text(value, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
      Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10)),
      if (unit.isNotEmpty) Text(unit, style: const TextStyle(color: Colors.white54, fontSize: 9)),
    ]);
  }

  Widget _infoCard(String title, List<String> items, Color bg, Color textColor) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: textColor)),
          const SizedBox(height: 6),
          ...items.map((i) => Text("• $i", style: TextStyle(fontSize: 12, color: textColor))),
        ],
      ),
    );
  }

  Widget _recordCard(MedicalRecord r) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(r.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Text(r.date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          Text("${r.doctor} · ${r.hospital}", style: const TextStyle(color: kBlue, fontSize: 12, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(r.notes, style: const TextStyle(color: Colors.grey, fontSize: 12, height: 1.5)),
          if (r.prescriptions.isNotEmpty) ...[
            const SizedBox(height: 10),
            const Text("Prescriptions:", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Wrap(
              spacing: 6, runSpacing: 6,
              children: r.prescriptions.map((p) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(color: kGreenBg, borderRadius: BorderRadius.circular(10)),
                child: Text(p, style: const TextStyle(color: kGreen, fontSize: 11, fontWeight: FontWeight.w600)),
              )).toList(),
            ),
          ],
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//                      PROFILE SCREEN
// ═══════════════════════════════════════════════════════════════
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _smsReminder = true;
  bool _emailReminder = false;
  bool _pushNotif = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile"), automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile header
            Container(
              color: kBlueDark,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              child: Column(children: [
                Container(
                  width: 86, height: 86,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 3), color: kBlueLight),
                  child: const Icon(Icons.person, color: kBlue, size: 46),
                ),
                const SizedBox(height: 12),
                const Text("Ridhiwani Kikwete", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                const Text("Patient ID: TZ-2024-004821", style: TextStyle(color: Colors.white60, fontSize: 12)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _statCol("8", "Total Visits"),
                    const SizedBox(width: 2),
                    Container(width: 1, height: 32, color: Colors.white24),
                    const SizedBox(width: 2),
                    _statCol("3", "Prescriptions"),
                    Container(width: 1, height: 32, color: Colors.white24),
                    _statCol("2", "Upcoming"),
                  ],
                ),
              ]),
            ),
            // Info section
            _profileSection("Personal Information", [
              _infoRow(Icons.person_outline, "Full Name", "Ridhiwani Kikwete"),
              _infoRow(Icons.cake_outlined, "Date of Birth", "12 June 1988 (36 yrs)"),
              _infoRow(Icons.bloodtype_outlined, "Blood Type", "O Positive"),
              _infoRow(Icons.phone_outlined, "Phone", "+255 712 345 678"),
              _infoRow(Icons.email_outlined, "Email", "ridhiwani@email.com"),
              _infoRow(Icons.location_on_outlined, "Location", "Kinondoni, Dar es Salaam"),
            ]),
            _profileSection("Medical Information", [
              _infoRow(Icons.warning_amber_outlined, "Allergies", "Penicillin, Sulfa drugs", valueColor: Colors.red),
              _infoRow(Icons.monitor_heart_outlined, "Blood Pressure", "120/80 mmHg"),
              _infoRow(Icons.thermostat_outlined, "Temperature", "37.2°C"),
              _infoRow(Icons.healing_outlined, "Chronic Conditions", "Mild Hypertension"),
              _infoRow(Icons.emergency_outlined, "Emergency Contact", "+255 754 987 654"),
            ]),
            _profileSection("Appointment Reminders", [
              _toggleRow("SMS Reminders", _smsReminder, (v) => setState(() => _smsReminder = v)),
              _toggleRow("Email Reminders", _emailReminder, (v) => setState(() => _emailReminder = v)),
              _toggleRow("Push Notifications", _pushNotif, (v) => setState(() => _pushNotif = v)),
            ]),
            _profileSection("More", [
              _menuRow(Icons.local_pharmacy_outlined, "Nearby Pharmacies", kGreen, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PharmacyScreen()))),
              _menuRow(Icons.help_outline, "Help & Support", Colors.purple, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpCenterScreen()))),
              _menuRow(Icons.medical_services_outlined, "Disease Library", kBlue, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DiseaseLibraryScreen()))),
              _menuRow(Icons.privacy_tip_outlined, "Privacy Policy", Colors.grey, () {}),
            ]),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text("Sign Out", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _statCol(String val, String label) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(children: [
      Text(val, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
      Text(label, style: const TextStyle(color: Colors.white60, fontSize: 11)),
    ]),
  );

  Widget _profileSection(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.grey.shade100)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
            child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kBlue)),
          ),
          const Divider(height: 1),
          ...children,
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      child: Row(children: [
        Icon(icon, size: 18, color: kBlue),
        const SizedBox(width: 12),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
            const SizedBox(height: 1),
            Text(value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: valueColor ?? Colors.black87)),
          ],
        )),
      ]),
    );
  }

  Widget _toggleRow(String label, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(children: [
        const Icon(Icons.notifications_outlined, size: 18, color: kBlue),
        const SizedBox(width: 12),
        Expanded(child: Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600))),
        Switch(value: value, onChanged: onChanged, activeColor: kBlue),
      ]),
    );
  }

  Widget _menuRow(IconData icon, String label, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        child: Row(children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600))),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 18),
        ]),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//                   SYMPTOM CHECKER SCREEN
// ═══════════════════════════════════════════════════════════════
class SymptomCheckerView extends StatefulWidget {
  const SymptomCheckerView({super.key});

  @override
  State<SymptomCheckerView> createState() => _SymptomCheckerViewState();
}

class _SymptomCheckerViewState extends State<SymptomCheckerView> {
  final Set<String> _selected = {};
  Map<String, String>? _result;

  void _checkSymptoms() {
    if (_selected.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please select at least one symptom"), backgroundColor: Colors.orange));
      return;
    }
    final s = _selected.map((x) => x.toLowerCase()).toSet();
    Map<String, String> res;
    if (s.contains("fever") && s.contains("headache")) {
      res = {"name": "Possible Malaria", "detail": "Fever and headache are hallmark symptoms of malaria. Visit a clinic for RDT testing. Do not self-medicate.", "urgency": "Moderate — Seek care within 24 hrs", "color": "orange"};
    } else if (s.contains("cough") && (s.contains("weight loss") || s.contains("night sweats"))) {
      res = {"name": "Possible Tuberculosis (TB)", "detail": "Persistent cough with weight loss and night sweats may indicate TB. Visit a health facility for sputum testing.", "urgency": "High — Visit clinic today", "color": "red"};
    } else if (s.contains("diarrhoea") && s.contains("vomiting")) {
      res = {"name": "Possible Gastroenteritis / Cholera", "detail": "These symptoms suggest dehydration risk. Drink ORS and clean fluids. Seek care if you cannot keep fluids down.", "urgency": "Moderate — Monitor closely", "color": "orange"};
    } else if (s.contains("chest pain") || s.contains("shortness of breath")) {
      res = {"name": "Cardiac / Respiratory Emergency", "detail": "Chest pain and breathing difficulty require immediate evaluation. Do not delay — go to the nearest hospital or call emergency services.", "urgency": "URGENT — Go to hospital now", "color": "red"};
    } else if (s.contains("rash") && s.contains("fever")) {
      res = {"name": "Possible Viral Infection / Dengue", "detail": "Fever with rash may indicate dengue fever or another viral illness. Consult a doctor and avoid aspirin.", "urgency": "Moderate — See doctor soon", "color": "orange"};
    } else {
      res = {"name": "General Illness", "detail": "Based on your symptoms (${_selected.join(', ')}), we recommend consulting a General Practitioner for a proper clinical assessment.", "urgency": "Low — Book an appointment", "color": "green"};
    }
    setState(() => _result = res);
  }

  @override
  Widget build(BuildContext context) {
    final resultColor = _result != null
        ? (_result!["color"] == "red" ? Colors.red : _result!["color"] == "orange" ? Colors.orange : kGreen)
        : kGreen;

    return Scaffold(
      appBar: AppBar(title: const Text("Symptom Checker")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: kBlueLight, borderRadius: BorderRadius.circular(14)),
              child: const Row(children: [
                Icon(Icons.info_outline, color: kBlue, size: 18),
                SizedBox(width: 10),
                Expanded(child: Text("Select all symptoms you are currently experiencing. This is for guidance only — not a medical diagnosis.", style: TextStyle(color: kBlue, fontSize: 12, height: 1.4))),
              ]),
            ),
            const SizedBox(height: 16),
            const Text("Your Symptoms", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8, runSpacing: 8,
              children: kSymptoms.map((s) {
                final sel = _selected.contains(s);
                return FilterChip(
                  label: Text(s, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: sel ? Colors.white : Colors.black87)),
                  selected: sel,
                  onSelected: (_) => setState(() { sel ? _selected.remove(s) : _selected.add(s); _result = null; }),
                  selectedColor: kBlue,
                  backgroundColor: Colors.grey.shade100,
                  checkmarkColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            if (_selected.isNotEmpty) Wrap(
              children: _selected.map((s) => Container(
                margin: const EdgeInsets.only(right: 6, bottom: 6),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: kBlueLight, borderRadius: BorderRadius.circular(10)),
                child: Text(s, style: const TextStyle(fontSize: 11, color: kBlue, fontWeight: FontWeight.w600)),
              )).toList(),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.search),
                label: const Text("Check Symptoms", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(backgroundColor: kBlue, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                onPressed: _checkSymptoms,
              ),
            ),
            if (_result != null) ...[
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: resultColor.withOpacity(0.08), borderRadius: BorderRadius.circular(16), border: Border.all(color: resultColor.withOpacity(0.3))),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Icon(Icons.medical_services, color: resultColor, size: 20),
                    const SizedBox(width: 8),
                    Expanded(child: Text(_result!["name"]!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: resultColor))),
                  ]),
                  const SizedBox(height: 8),
                  Text(_result!["detail"]!, style: const TextStyle(color: Colors.black87, fontSize: 13, height: 1.5)),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: resultColor.withOpacity(0.15), borderRadius: BorderRadius.circular(10)),
                    child: Text("⚡ ${_result!['urgency']!}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: resultColor)),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: kBlue, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DoctorSearchScreen())),
                      child: const Text("Find a Doctor Now", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ]),
              ),
            ],
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//                   DISEASE LIBRARY SCREEN
// ═══════════════════════════════════════════════════════════════
class DiseaseLibraryScreen extends StatelessWidget {
  const DiseaseLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Disease Library")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: kDiseases.length,
        itemBuilder: (context, i) {
          final d = kDiseases[i];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DiseaseDetailView(disease: d))),
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.grey.shade100)),
              child: Row(children: [
                Container(
                  width: 50, height: 50,
                  decoration: BoxDecoration(color: d.color.withOpacity(0.1), borderRadius: BorderRadius.circular(14)),
                  child: Center(child: Text(d.icon, style: const TextStyle(fontSize: 24))),
                ),
                const SizedBox(width: 14),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(d.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 4),
                  Text(d.symptoms.split(",").take(2).join(", "), style: const TextStyle(color: Colors.grey, fontSize: 12), overflow: TextOverflow.ellipsis),
                ])),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ]),
            ),
          );
        },
      ),
    );
  }
}

class DiseaseDetailView extends StatelessWidget {
  final Disease disease;
  const DiseaseDetailView({super.key, required this.disease});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(disease.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: disease.color.withOpacity(0.08), borderRadius: BorderRadius.circular(20)),
            child: Column(children: [
              Text(disease.icon, style: const TextStyle(fontSize: 56)),
              const SizedBox(height: 8),
              Text(disease.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: disease.color)),
            ]),
          ),
          const SizedBox(height: 16),
          _disSection("🤒 Symptoms", disease.symptoms, Colors.red.shade50, Colors.red.shade800),
          _disSection("🛡️ Prevention", disease.prevention, kGreenBg, kGreen),
          _disSection("💊 Treatment", disease.treatment, kBlueLight, kBlue),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.search),
              label: const Text("Find a Specialist", style: TextStyle(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(backgroundColor: kBlue, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DoctorSearchScreen())),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _disSection(String title, String content, Color bg, Color textColor) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: textColor)),
        const SizedBox(height: 8),
        Text(content, style: const TextStyle(color: Colors.black87, fontSize: 13, height: 1.6)),
      ]),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//                    PHARMACY SCREEN
// ═══════════════════════════════════════════════════════════════
class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Pharmacies"),
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Map simulation
          Container(
            height: 220,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F4F8),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  // Grid roads
                  ...[0.28, 0.50, 0.72].map((f) => Positioned(
                    top: 0, bottom: 0,
                    left: MediaQuery.of(context).size.width * f - 16,
                    child: Container(width: 10, color: const Color(0xFFD4C5A9)),
                  )),
                  ...[0.25, 0.50, 0.75].map((f) => Positioned(
                    left: 0, right: 0,
                    top: 220 * f,
                    child: Container(height: 10, color: const Color(0xFFD4C5A9)),
                  )),
                  // Blocks
                  ...[
                    [0.04, 0.04, 0.22, 0.18], [0.32, 0.04, 0.16, 0.18],
                    [0.04, 0.29, 0.22, 0.18], [0.32, 0.29, 0.16, 0.18],
                    [0.04, 0.55, 0.22, 0.20], [0.32, 0.55, 0.16, 0.20],
                  ].map((b) => Positioned(
                    left: b[0] * (MediaQuery.of(context).size.width - 64),
                    top: b[1] * 220,
                    width: b[2] * (MediaQuery.of(context).size.width - 64),
                    height: b[3] * 220,
                    child: Container(decoration: BoxDecoration(color: const Color(0xFFC8D6B2), borderRadius: BorderRadius.circular(6))),
                  )),
                  // You are here
                  Positioned(
                    left: (MediaQuery.of(context).size.width - 64) * 0.47,
                    top: 220 * 0.44,
                    child: Container(
                      width: 16, height: 16,
                      decoration: BoxDecoration(
                        color: kBlue,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.5),
                        boxShadow: [BoxShadow(color: kBlue.withOpacity(0.4), blurRadius: 8, spreadRadius: 3)],
                      ),
                    ),
                  ),
                  // Pharmacy pins
                  ...[
                    [0.08, 0.06, true], [0.60, 0.06, true], [0.62, 0.57, true],
                    [0.82, 0.29, false], [0.35, 0.75, true],
                  ].asMap().entries.map((e) {
                    final p = e.value;
                    return Positioned(
                      left: (p[0] as double) * (MediaQuery.of(context).size.width - 64) - 14,
                      top: (p[1] as double) * 220 - 14,
                      child: Container(
                        width: 28, height: 28,
                        decoration: BoxDecoration(
                          color: (p[2] as bool) ? kGreen : Colors.orange,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
                        ),
                        child: const Center(child: Text("💊", style: TextStyle(fontSize: 12))),
                      ),
                    );
                  }),
                  // Legend
                  Positioned(
                    bottom: 8, right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(children: [Icon(Icons.circle, color: kGreen, size: 10), SizedBox(width: 4), Text("Open", style: TextStyle(fontSize: 10))]),
                          Row(children: [Icon(Icons.circle, color: Colors.orange, size: 10), SizedBox(width: 4), Text("Closed", style: TextStyle(fontSize: 10))]),
                          Row(children: [Icon(Icons.circle, color: kBlue, size: 10), SizedBox(width: 4), Text("You", style: TextStyle(fontSize: 10))]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Pharmacy list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              itemCount: kPharmacies.length,
              itemBuilder: (context, i) {
                final p = kPharmacies[i];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade100),
                  ),
                  child: Row(children: [
                    Container(
                      width: 46, height: 46,
                      decoration: BoxDecoration(color: kGreenBg, borderRadius: BorderRadius.circular(12)),
                      child: const Center(child: Text("💊", style: TextStyle(fontSize: 22))),
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 2),
                      Text("📍 ${p.distance} away", style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      Text(p.isOpen ? "✅ ${p.hours}" : "🔴 ${p.hours}", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: p.isOpen ? kGreen : Colors.red)),
                    ])),
                    Column(children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: kBlue, foregroundColor: Colors.white, minimumSize: const Size(76, 32), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), padding: EdgeInsets.zero),
                        onPressed: () {},
                        child: const Text("Directions", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 6),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(minimumSize: const Size(76, 30), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), padding: EdgeInsets.zero, side: BorderSide(color: Colors.grey.shade300)),
                        onPressed: () {},
                        child: const Text("Call", style: TextStyle(fontSize: 11)),
                      ),
                    ]),
                  ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//                    HELP CENTER SCREEN
// ═══════════════════════════════════════════════════════════════
class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  int? _openFaq;

  final _faqs = [
    {"q": "How do I book an appointment?", "a": "Go to Find Doctors, select a doctor, tap Book Appointment, choose your date and time slot, then complete payment via M-Pesa, Tigo Pesa, or Airtel Money."},
    {"q": "Is my medical information secure?", "a": "Yes. All data is encrypted and stored securely. We comply with Tanzania's health data regulations and never share your information without your explicit consent."},
    {"q": "How does video consultation work?", "a": "After booking and payment, tap 'Join Call' in your Bookings tab at the scheduled time. You will be connected directly to your doctor via our secure HD video platform."},
    {"q": "Can I cancel or reschedule an appointment?", "a": "Yes, up to 2 hours before your appointment time. Go to Bookings, select the appointment, and tap Reschedule or Cancel."},
    {"q": "What payment methods are accepted?", "a": "We accept M-Pesa, Tigo Pesa, Airtel Money, and bank card (Visa/Mastercard). All transactions are secured and receipts are sent via SMS."},
    {"q": "How do I get my prescription?", "a": "After consultation, your doctor sends the prescription digitally. View it under Bookings → Prescriptions. You can send it directly to a pharmacy from the app."},
    {"q": "Can I use the app without registering?", "a": "Yes! You can browse doctors, check symptoms, and view the disease library without creating an account. Registration is only required to book appointments."},
  ];

  final _categories = [
    {"icon": "📅", "title": "Appointments", "sub": "Booking, rescheduling, cancellations", "color": Color(0xFFE3EDFF)},
    {"icon": "💳", "title": "Payments & Billing", "sub": "M-Pesa, refunds, receipts", "color": Color(0xFFE8F5E9)},
    {"icon": "📋", "title": "Medical Records", "sub": "Access, sharing, downloads", "color": Color(0xFFFFF3E0)},
    {"icon": "📹", "title": "Video Consultation", "sub": "Tech issues, quality, settings", "color": Color(0xFFF3E5F5)},
    {"icon": "💊", "title": "Prescriptions", "sub": "Viewing, sending to pharmacy", "color": Color(0xFFFBE9E7)},
    {"icon": "🔒", "title": "Privacy & Security", "sub": "Data protection, account safety", "color": Color(0xFFE0F2F1)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support"),
        backgroundColor: Colors.purple.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: Colors.grey.shade200)),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search help topics…",
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Help Categories", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2.4,
              children: _categories.map((c) => Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: c["color"] as Color, borderRadius: BorderRadius.circular(14)),
                child: Row(children: [
                  Text(c["icon"] as String, style: const TextStyle(fontSize: 22)),
                  const SizedBox(width: 10),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(c["title"] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12), overflow: TextOverflow.ellipsis),
                    Text(c["sub"] as String, style: const TextStyle(fontSize: 10, color: Colors.black54), overflow: TextOverflow.ellipsis),
                  ])),
                ]),
              )).toList(),
            ),
            const SizedBox(height: 20),
            const Text("Frequently Asked Questions", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ..._faqs.asMap().entries.map((e) {
              final i = e.key; final faq = e.value;
              final open = _openFaq == i;
              return GestureDetector(
                onTap: () => setState(() => _openFaq = open ? null : i),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: open ? Colors.purple.shade200 : Colors.grey.shade100)),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(children: [
                        Expanded(child: Text(faq["q"]!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
                        Icon(open ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.grey),
                      ]),
                    ),
                    if (open) Padding(
                      padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                      child: Text(faq["a"]!, style: const TextStyle(color: Colors.grey, fontSize: 12, height: 1.5)),
                    ),
                  ]),
                ),
              );
            }),
            const SizedBox(height: 20),
            const Text("Contact Us", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(child: _contactBtn("📞 Call Support", kBlueLight, kBlue, () {})),
              const SizedBox(width: 10),
              Expanded(child: _contactBtn("💬 Live Chat", kGreenBg, kGreen, () {})),
              const SizedBox(width: 10),
              Expanded(child: _contactBtn("✉️ Email Us", const Color(0xFFF3E5F5), Colors.purple, () {})),
            ]),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(14), border: Border.all(color: Colors.grey.shade200)),
              child: const Row(children: [
                Icon(Icons.access_time, color: Colors.grey, size: 18),
                SizedBox(width: 10),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Support Hours", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  Text("Mon–Fri: 8:00 AM – 8:00 PM\nSat–Sun: 9:00 AM – 5:00 PM\nEmergency: 24/7 Hotline", style: TextStyle(color: Colors.grey, fontSize: 12, height: 1.5)),
                ])),
              ]),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _contactBtn(String label, Color bg, Color textColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(14)),
        child: Text(label, textAlign: TextAlign.center, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 12)),
      ),
    );
  }
}