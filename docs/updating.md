# Поддержка новой версии Google Maps SDK для iOS

1. Удали всё из папки `Downloaded-XCFrameworks` в репозитории.
2. Скачай свежий архив с xcframework [с официального сайта](https://developers.google.com/maps/documentation/ios-sdk/config#xcframework-manual).
3. Распакуй его и перенеси xcframework-и из `GoogleMaps-x.y.z/{Base,Maps}/Frameworks` в `Downloaded-XCFrameworks` в репозитории. Таким образом, в папке со скачанными фрэймворками должно быть три xcframework: `GoogleMaps`, `GoogleMapsBase` и `GoogleMapsCore`.
4. Открой `GoogleMapsFrameworks.xcworkspace` и проверь, что header-файлы в группах _Headers_ ссылаются на существующие файлы (не отмечены красным в Xcode).
5. Удали всё из папки `Build/` и запусти скрипт `make_release.sh`. В `Build/` будут лежат zip-архивы и файл `checksum`. 
6. Обнови `Package.swift` так, чтобы ссылки указывали на будущий релиз (версия должна совпадать с x.y.z скачанного архива) и посчитанную контрольную сумму из файла `checksum`.
7. Создай новый тэг x.y.z в Git.
8. Запушай новый `Package.swift` и тэг на GitHub.
9. Создай новый релиз на GitHub (Draft a new release, Choose a tag, выбери созданный тэг и загрузи в артефакты релиза собранные zip-архивы).

# Решения известных проблем

## Тэг и релиз опубликованы, но из-за них не собирается проект

* Удали релиз и тэг из GitHub
* Исправь ошибку, запушай исправленный код
* Если пробовал собирать проект локально с бажной версией, то удали две папки и перезапусти сборку:
	* `~/Library/Caches/org.swift.swiftpm`
	* `~/Library/org.swift.swiftpm`

## GoogleMaps.h новой версии ссылается на несуществующие ранее файлы

Для проверки того, какие были файлы добавлены в `GoogleMaps.h` можно воспользоваться следующим Bash-скриптом:

```bash
FILES=$(cut -d\" -f2 < GoogleMaps.h)
for FILE in $FILES; do 
  if [[ ! -f "$FILE" ]]; then
    echo "$FILE doesn't exist"
  fi
done
```

Эти файлы нужно drag-n-drop-нуть оба проекта (под устройство и симулятор), а также установить им Public атрибут в Build Phases > "Headers".