# Flutter Movie App - Clean Architecture

Bu proje, **Flutter** kullanarak **`Clean Architecture`** prensiplerini öğrenmek amacıyla oluşturulmuştur. Uygulama, **`REST API`** üzerinden veri çekme, **`BLoC`** state management, **`auto_route`** ile navigasyon, **`get_it`** ile bağımlılık enjeksiyonu, **`easy_localization`** ile çoklu dil desteği, **`json_serializable`** ve **`equatable`** kullanımı, **`envied`** ile ortam değişkenleri, **`kartal`** paketi ile temel fonksiyonlar gibi birçok önemli konsepti içermektedir.

## Proje Yapısı

Proje, aşağıdaki temel katmanlardan oluşmaktadır:

- **APP:** `Uygulamanın geneline ait sınıfları içerir. Uygulama başlangıcında çalıştırılacak sınıflar bu klasörde yer alır.`

- **DATA:**

  - **Data Sources:** `Uygulamanın veri kaynaklarına (API çağrıları, veritabanı işlemleri vb.) ait sınıfları içerir.`
  - **Models:** `Veri modelleri bu klasörde tanımlanır.`
  - **Repositories:** `Veri kaynaklarına erişimi yöneten repository sınıflarını içerir.`

- **DOMAIN:**

  - **Entities:** `Uygulamanın iş mantığındaki temel nesneler (entity) bu klasörde tanımlanır.`
  - **Repositories:** `Uygulama için gerekli veri kaynaklarına erişimi yöneten repository arayüzleri bulunur.`
  - **Use Cases:** `Uygulamanın kullanım senaryolarını (use cases) içerir.`

- **PRESENTATION:**
  - **Bloc:** `Uygulamanın iş mantığı ile arayüz katmanı arasında köprü görevi gören BLoC sınıfları bu klasörde yer alır.`
  - **Views:** `Uygulamanın ekranlarını oluşturan widget'lar bu klasörde bulunur.`
  - **Widgets:** `Genel amaçlı widget'lar ve özelleştirilmiş arayüz elemanları bu klasörde tanımlanır.`

## Local Paketler

Proje, aşağıdaki paketleri içermektedir:

- **COMMON:** `3. parti paketlerin bulunduğu paket.`
- **CORE:** `Tüm projelerde kullanılacak temel sınıfları içerir.`
- **WIDGETS:** `Tüm projelerde kullanılacak genel amaçlı widgetlar ve fonksiyonları içerir.`

## Kullanılan Teknolojiler ve Kütüphaneler

- **State Management:**

  - BLoC -> [flutter_bloc](https://pub.dev/packages/flutter_bloc)
  - Riverpod -> [flutter_riverpod](https://pub.dev/packages/flutter_riverpod)

- **Navigation:**

  - Auto Route -> [auto_route](https://pub.dev/packages/auto_route)

- **Dependency Injection:**

  - Get It -> [get_it](https://pub.dev/packages/get_it)

- **Multi Language Support:**

  - Easy Localization -> [easy_localization](https://pub.dev/packages/easy_localization)

- **Serialization And Equality:**

  - Json Serializable -> [json_serializable](https://pub.dev/packages/json_serializable)
  - Json Annotation -> [json_annotation](https://pub.dev/packages/json_annotation)
  - Equatable -> [equatable](https://pub.dev/packages/equatable)

- **Environment Variables:**

  - Envied -> [envied](https://pub.dev/packages/envied)

- **Core:**

  - Kartal -> [kartal](https://pub.dev/packages/kartal)

- **Linting:**

  - Very Good Analysis -> [very_good_analysis](https://pub.dev/packages/very_good_analysis)

## Thanks

- [VB10](https://github.com/vb10)
