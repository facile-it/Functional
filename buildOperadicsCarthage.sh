carthage checkout Functional
carthage checkout Operadics
cd Carthage/Checkouts/Operadics
xcrun swift package generate-xcodeproj --xcconfig-overrides ../../../Carthage/Checkouts/Functional/deployments.xcconfig
cd ../../..
carthage build Operadics
