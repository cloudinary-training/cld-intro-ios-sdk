# Introduction to Cloudinary's iOS SDK
This repository is used in conjunction with the Cloudinary Academy training course, **Introduction to Cloudinary's iOS SDK**.

If you would like to take this 35-minute course, you can enroll for free at [training.cloudinary.com](https://training.cloudinary.com).

# Course Outline:
The information below corresponds with the [slides](https://cloudinary-marketing-res.cloudinary.com/image/upload/v1708030268/Intro-to-Cloudinary-Android-SDK.pdf) used in **Introduction to Cloudinary's iOS SDK**.

Course Topics:
- Introduction
  - Mobile Development
  - Environment Setup
- Upload
  - Upload
  - Cloudinary Upload Widget
  - Cloudinary Image Widget
  - Pre Processing Image 
- Delivery
  - Transformations
  - Complex Transformations
  - Optimizations
- Video
  - Cloudinary Native Video Player
  - Video Feed 
- Further Support

---

## Setup Environment

### Swift

### IDE

We'll be presenting this content using [XCode](https://apps.apple.com/us/app/xcode/id497799835?mt=12)

This is the entry point to static "runners" that contain code to help you upload, manage and transform your media.


### Install Swift

- We are using Swift version 5.9.2 in the course
- You can find [instructions for downloading and installing Swift ](https://www.swift.org/install/) for many environments.

### Verify your version of Swift is 5.9+

```
swift -version

```
Sample output for Version 5.9.2

```bash
$ swiftc -version
swift-driver version: 1.87.3 Apple Swift version 5.9.2 (swiftlang-5.9.2.2.56 clang-1500.1.0.2.5)
Target: arm64-apple-macosx14.0
```

## Installation
### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Swift and Objective-C Cocoa projects. 
To install CocoaPods:

```bash
sudo gem install cocoapods
```
If you don't have a `Podfile` in your project yet, add it by running the command:
```bash
pod init
```

Add the Cloudinary SDK to your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target 'MyApp' do
  pod 'Cloudinary', '~> 5.0'
end
```

Then, run the command:

```bash
pod install
```

### Carthage

Create `Cartfile`
```bash
touch Cartfile
```

Open `Cartfile` and enter the following line

```bash
github "cloudinary/cloudinary_ios" ~> 5.0
```

Then, run the command:

```bash
carthage update --use-xcframeworks
```
A `Cartfile.resolved` file and a `Carthage` directory will appear in the same directory where your `.xcodeproj` or `.xcworkspace` is.
Drag the built `.xcframework` bundles from `Carthage/Build` into the `Frameworks and Libraries` section of your application’s Xcode project.

### Swift Package Manager
* File > Add Packages... >
* Add https://github.com/cloudinary/cloudinary_ios.git
* Select "Up to Next Major" with "5.0.0"

### Working with the Cloudinary iOS SDK Manually

If you prefer not use a dependency manager, you can add Cloudinary manually by adding it as a submodule to your project:

Open Terminal and navigate to your project's top level directory.

If your project is not initialized as a git repository, run the command:

```bash
git init
```

To add cloudinary as a git submodule, run the command:

```bash
git submodule add https://github.com/cloudinary/cloudinary_ios.git
```

## Providing Cloudinary Credentials

You will need to [register for a free Cloudinary account](https://cloudinary.com/users/register/free) to work along with this training.

It is recommended that you create a training account for this training to keep this work separate from any work you do in a production Cloudinary account.

You only need an email address that can be verified to set up this account.

Navigate to:  [https://cloudinary.com/console](https://cloudinary.com/console)

![cloudinary url](https://res.cloudinary.com/jen-brissman/image/upload/v1702021754/cld-url.png)

CLOUD_NAME and API_KEY can be revealed without creating any security issues, but you must keep API_SECRET private. It’s strongly recommended not to keep your API Secret anywhere within the app code.


Don't check it into GitHub and don't include it in blog posts.
- For this course, you only need your cloud name, so there won't be any risk of security. 

---
## Resources

[Cloudinary Academy](training.cloudinary.com)

[Cloudinary Documentation](https://cloudinary.com/documentation)

[Cloudinary Academy GitHub Respositories](https://github.com/cloudinary-training)

[Cloudinary GitHub Repository](https://github.com/cloudinary)

[Support Request](https://support.cloudinary.com/hc/en-us/requests/new)

[Support Email support@cloudinary.com](mailto:support@cloudinary.com)
