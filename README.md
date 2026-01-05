# 📜 Söz Uçar - Motivasyon Sözleri Uygulaması

Firebase tabanlı günlük motivasyon sözleri ve ilham veren alıntılar uygulaması. Animasyonlu metin efektleri, paylaşım ve reklam entegrasyonu ile kullanıcı deneyimini zenginleştirir.

---

## ✨ Özellikler

### 💬 Günlük Sözler
- **Rastgele Sözler:** Firebase'den dinamik içerik
- **Kategori Filtreleme:** Konu bazlı sözler
- **Favoriler:** Beğenilen sözleri kaydetme

### 🎬 Animasyonlar
- **Animated Text:** Typewriter efektleri
- **Lottie:** İnteraktif animasyonlar

### 📤 Paylaşım
- **Share Plus:** Sosyal medya paylaşımı
- **URL Launcher:** Harici linkler

### 📺 Reklam
- **Google AdMob:** Uygulama içi reklamlar

### 🔥 Firebase
- **Cloud Firestore:** Söz veritabanı
- **Realtime Database:** Anlık güncellemeler

---

## 🛠️ Kullanılan Teknolojiler

| Kategori | Teknoloji |
|----------|-----------|
| **Framework** | Flutter 3.1+ (Dart) |
| **Durum Yönetimi** | MobX, Provider |
| **Firebase** | Core, Firestore, Realtime Database |
| **HTTP** | Dio ^5.0.0 |
| **Animasyon** | animated_text_kit, lottie |
| **Reklam** | google_mobile_ads ^5.1.0 |
| **Paylaşım** | share_plus ^9.0.0 |
| **UI/UX** | flutter_screenutil, flutter_svg |

---

## 📦 Kurulum

```bash
git clone https://github.com/kullanici/soz_ucar.git
cd soz_ucar
flutter pub get
flutter pub run build_runner build
flutter run
```

---

## 📁 Asset Yapısı

```
assets/
└── lottie/     # Lottie animasyonları
```

---

## 📝 Lisans

Bu proje kişisel kullanım için geliştirilmiştir.
