# Поддержка новой версии Google Maps SDK для iOS

1. Удалите всё из папки `Downloaded-XCFrameworks` в репозитории.
2. Скачайте свежий архив с xcframework [с официального сайта](https://developers.google.com/maps/documentation/ios-sdk/config#xcframework-manual).
3. Распакуйте его и перенесите xcframework-и из `GoogleMaps-x.y.z/{Base,Maps}/Frameworks` в `Downloaded-XCFrameworks` в репозитории. Таким образом, в папке со скачанными фрэймворками должно быть три xcframework: `GoogleMaps`, `GoogleMapsBase` и `GoogleMapsCore`.
4. Откройте `GoogleMapsFrameworks.xcworkspace` и проверьте, что header-файлы в группах _Headers_ не ссылаются на несуществующие файлы.
5. Удалите всё из папки `Build/` и запустите скрипт `make_release.sh`. В `Build/` будут лежат zip-архивы и файл `checksum`. 
6. Обновите `Package.swift` так, чтобы ссылки указывали на будущий релиз (версия должна совпадать с x.y.z скачанного архива) и посчитанную контрольную сумму из файла `checksum`.
7. Запушайте новый `Package.swift` в GitHub.
8. Создайте новый релиз на GitHub (по тэгу, артефакты релиза укажите собранные zip-архивы).
