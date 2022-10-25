# Как создан проект

1. `GoogleMapsFrameworks.xcworkspace` ссылается на два проекта:
	- `GoogleMaps-Device.xcodeproj`
	- `GoogleMaps-Simulator.xcodeproj`
2. Project Format: Xcode 13-compatible, потому что на CI Дринкит собирается Xcode 13.4.1.
2. Workspace создан для удобства обновления настроек в проектах, потому что меняются они часто синхронно. Например, iOS Deployment Target.
3. Проект с суффиксом *Device* ссылается на сборки SDK под устройство, а *Simulator* — под симулятор.
4. В каждом проекте есть по три таргета (iOS -> Framework). В принципе, там может быть и больше таргетов, если вы хотите в своём Swift Package поставлять другие SDK Google.
	- `GoogleMaps`
	- `GoogleMapsBase`
	- `GoogleMapsCore`
5. По-умолчанию вместе с таргетом создаётся header-файл. Он нам не нужен, удаляем.
6. Для каждого таргета заданы следующие настройки (вкладка *Build Settings* в свойствах таргета):
	- Deployment Target: iOS 13.0
	- Build Libraries for Distribution: Yes
	- Skip install: Yes
	- Generate Info.plist File: Yes
	- Module Map File: `../Downloaded-XCFrameworks/$TARGET_NAME.xcframework/[ios-arm64|
ios-arm64_x86_64-simulator]/$TARGET_NAME.framework/Modules/module.modulemap`
	- Marketing Version: 7.1.0. Актуальная версия GoogleMaps iOS SDK на момент написания этого документа.
7. Для таргета *GoogleMaps* отдельно:
	- Other Linker Flags: `-ObjC`
8. В папку `Downloaded-XCFrameworks` был скачан и распакован архив [GoogleMaps-x.y.z-beta.tar.gz](https://developers.google.com/maps/documentation/ios-sdk/config#xcframework-manual). Содержимое архива было перемещено в `Downloaded-XCFrameworks` так, чтобы внутри были папки `GoogleMaps.xcframework`, `GoogleMapsBase.xcframework` и `GoogleMapsCore.xcframework`.
9. Перетаскиваем для каждой платформы и каждого фреймворка в соответствующую группу в Xcode workspace. Например, содержимое `Downloaded-XCFrameworks/GoogleMaps.xcworkspace/ios-arm64/GoogleMaps.framework` пересено в группу `GoogleMaps` в проекте `GoogleMaps-Device`. При добавлении выбираем не копировать. Большинство файлов добавляется корректно. После добавления нужно убедиться, что:
	- Header-файлы перетащены из *Project* в группу *Public* (вкладка *Build Phases* таргета), неактуально для `GoogleMapsCore`.
	- Bundle с ресурсами есть в фазе *Copy Bundle Resources* (актуально только для `GoogleMaps`)
10. Для `GoogleMaps` таргета выставляем target dependencies: `GoogleMapsBase` и `GoogleMapsCore`.
9. Настраиваем линковку.
	- GoogleMaps, Link Binary With Libraries:
		- GoogleMaps (должен быть уже добавлен)
		- GoogleMaps-[Device|Simulator] Project:
			- GoogleMapsBase.framework (не понимаю зачем явно добавлено, но лучше пусть будет; главное, чтобы работало)
		- Apple SDKs:
			- CoreData.framework
			- CoreGraphics.framework
			- CoreImage.framework
			- CoreLocation.framework
			- CoreTelephony.framework
			- CoreText.framework
			- Foundation.framework
			- GLKit.framework
			- ImageIO.framework
			- libc++.tbd
			- libz.tbd
			- Metal.framework
			- OpenGLES.framework
			- QuartzCore.framework
			- SystemConfiguration.framework
			- UIKit.framework
		- GoogleMapsCore (добавить через Add Other… > Add Files…)
	- GoogleMapsBase, Link Binary With Libraries:
		- Apple SDKs:
			- CoreFoundation.framework
			- CoreGraphics.framework
			- CoreLocation.framework
			- CoreTelephony.framework
			- CoreText.framework
			- Foundaion.framework
			- GoogleMapsBase (должен быть уже добавлен)
			- QuartzCore.framework
			- Security.framework
			- UIKit.framework
			- libc++.tbd
			- libz.tbd
	- GoogleMapsCore, Link Binary With Libraries (должно быть ничего, но я прописывал, потому что в референсе было):
		- Apple SDKs:
			- CoreData.framework
			- CoreFoundation.framework
			- CoreGraphics.framework
			- CoreImage.framework
			- CoreLocation.framework
			- CoreTelephony.framework
			- CoreText.framework
			- Foundation.framework
			- GLKit.framework
			- ImageIO.framework
			- Metal.framework
			- OpenGLES.framework
			- QuartzCore.framework
			- Security.framework
			- SystemConfiguration.framework
			- UIKit.framework
			- libm.tbd
			- libz.tbd

11. Убрать линковку target membership GoogleMapsCore с GoogleMapsCore (сайдбар слева)