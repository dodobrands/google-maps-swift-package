# [DEPRECATED] GoogleMaps iOS SDK как Swift package

> [!WARNING]
> Используйте официальный сдк: https://github.com/googlemaps/ios-maps-sdk

Репозиторий со Swift package, позволяющий встроить Google Maps iOS SDK в проект, использующий Swift Package Manager.

Проект закрывает нереализованную функциональность в гугловом SDK.

Этот репозиторий создан с оглядкой на имеющиеся на GitHub проекты ([раз](https://github.com/YAtechnologies/GoogleMaps-SP) и [два](https://github.com/dplisek/GoogleMaps-SP)). Спасибо их создателям за проделанную работу.

Google Maps iOS SDK, а также код в этом репозитории распространяется [по лицензии](https://github.com/dodopizza/google-maps-swift-package/blob/main/LICENSE.google).

# Предупреждение

В репозитории намеренно хостятся только GoogleMaps, GoogleMapsCore и GoogleMapsBase, потому что остальные части Google Maps SDK не используются в Дринките. Добавление недостающих частей SDK при текущем подходе к обновлению библиотек приведёт к тому, что при их обновлении нужно будет делать больше ручной работы, что нежелательно.
