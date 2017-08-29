carthage checkout Operadics
cd Carthage/Checkouts/Operadics
xcrun swift package generate-xcodeproj --xcconfig-overrides ../../../deployments.xcconfig
cd ../../..
carthage build Operadics