<div id="top">

<!-- HEADER STYLE: CLASSIC -->
<div align="left">


# AI-SOLUTION

<em>Transforming Ideas into Intelligent Realities</em>

<!-- BADGES -->
<img src="https://img.shields.io/github/last-commit/LyNNxMooon/Ai-Solution?style=flat&logo=git&logoColor=white&color=0080ff" alt="last-commit">
<img src="https://img.shields.io/github/languages/top/LyNNxMooon/Ai-Solution?style=flat&color=0080ff" alt="repo-top-language">
<img src="https://img.shields.io/github/languages/count/LyNNxMooon/Ai-Solution?style=flat&color=0080ff" alt="repo-language-count">

<em>Built with the tools and technologies:</em>

<img src="https://img.shields.io/badge/JSON-000000.svg?style=flat&logo=JSON&logoColor=white" alt="JSON">
<img src="https://img.shields.io/badge/Markdown-000000.svg?style=flat&logo=Markdown&logoColor=white" alt="Markdown">
<img src="https://img.shields.io/badge/Swift-F05138.svg?style=flat&logo=Swift&logoColor=white" alt="Swift">
<img src="https://img.shields.io/badge/Gradle-02303A.svg?style=flat&logo=Gradle&logoColor=white" alt="Gradle">
<img src="https://img.shields.io/badge/Dart-0175C2.svg?style=flat&logo=Dart&logoColor=white" alt="Dart">
<img src="https://img.shields.io/badge/C++-00599C.svg?style=flat&logo=C++&logoColor=white" alt="C++">
<br>
<img src="https://img.shields.io/badge/XML-005FAD.svg?style=flat&logo=XML&logoColor=white" alt="XML">
<img src="https://img.shields.io/badge/Flutter-02569B.svg?style=flat&logo=Flutter&logoColor=white" alt="Flutter">
<img src="https://img.shields.io/badge/CMake-064F8C.svg?style=flat&logo=CMake&logoColor=white" alt="CMake">
<img src="https://img.shields.io/badge/Kotlin-7F52FF.svg?style=flat&logo=Kotlin&logoColor=white" alt="Kotlin">
<img src="https://img.shields.io/badge/YAML-CB171E.svg?style=flat&logo=YAML&logoColor=white" alt="YAML">

</div>
<br>

---

## Table of Contents

- [Overview](#overview)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Usage](#usage)
    - [Testing](#testing)
- [Features](#features)
- [Project Structure](#project-structure)
    - [Project Index](#project-index)

---

## Overview

Ai-Solution is a comprehensive developer toolkit for building scalable, AI-powered applications across multiple platforms using Flutter and Firebase. It provides a robust foundation with modular architecture, real-time communication, and extensive plugin support.

**Why Ai-Solution?**

This project streamlines the development of feature-rich, cross-platform AI applications. The core features include:

- 🧩 **Puzzle Piece:** Modular architecture with Bloc pattern for scalable, maintainable code
- 🌐 **Globe:** Cross-platform support including Web, iOS, Android, Windows, macOS, and Linux
- 🔒 **Lock:** Deep Firebase integration for authentication, real-time data, and cloud functions
- 💬 **Speech Balloon:** Real-time chat and inquiry management for seamless user and admin interactions
- 🎨 **Palette:** Reusable UI components and widgets for consistent, engaging interfaces
- 🚀 **Rocket:** Easy plugin registration and management to extend app capabilities

---

## Features

|      | Component            | Details                                                                                     |
| :--- | :------------------- | :------------------------------------------------------------------------------------------ |
| ⚙️  | **Architecture**     | <ul><li>Flutter-based mobile app with native integrations</li><li>Multi-platform support (Android, iOS, Web, Desktop)</li></ul> |
| 🔩 | **Code Quality**     | <ul><li>Consistent project structure with separate platform directories</li><li>Use of Kotlin, Swift, C++, Dart for respective modules</li></ul> |
| 📄 | **Documentation**    | <ul><li>Basic README with project overview</li><li>Includes `contents.json` and `analysis_options.yaml` for code standards</li></ul> |
| 🔌 | **Integrations**     | <ul><li>Firebase for backend services (`firebase.json`)</li><li>Multiple plugin registrations (`generated_plugin_registrant.cc`)</li><li>CI/CD tools like `pub`, `cmake`, `gradle` integrated into build process</li></ul> |
| 🧩 | **Modularity**       | <ul><li>Separate modules for Android (`build.gradle.kts`), iOS (`xcsettings`), and desktop (`CMakeLists.txt`)</li><li>Use of plugin registrants for extensibility</li></ul> |
| 🧪 | **Testing**          | <ul><li>Presence of `analysis_options.yaml` for static analysis</li><li>Potential unit tests in Dart and native code (implied by structure)</li></ul> |
| ⚡️  | **Performance**      | <ul><li>Native code (C++, Kotlin, Swift) for performance-critical parts</li><li>Use of CMake for optimized builds</li></ul> |
| 🛡️ | **Security**         | <ul><li>Entitlements files (`debugprofile.entitlements`, `release.entitlements`) for app security</li><li>Manifest files (`AndroidManifest.xml`, `manifest.json`) configured for permissions</li></ul> |
| 📦 | **Dependencies**     | <ul><li>Package management via `pubspec.yaml`, `pubspec.lock` for Dart dependencies</li><li>CMake and Gradle for native dependencies</li></ul> |

---

## Project Structure

```sh
└── Ai-Solution/
    ├── README.md
    ├── analysis_options.yaml
    ├── android
    │   ├── .gitignore
    │   ├── app
    │   ├── build.gradle.kts
    │   ├── gradle
    │   ├── gradle.properties
    │   └── settings.gradle.kts
    ├── assets
    │   ├── fonts
    │   └── images
    ├── firebase.json
    ├── ios
    │   ├── .gitignore
    │   ├── Flutter
    │   ├── Runner
    │   ├── Runner.xcodeproj
    │   ├── Runner.xcworkspace
    │   └── RunnerTests
    ├── lib
    │   ├── BLoC
    │   ├── app.dart
    │   ├── config
    │   ├── constant
    │   ├── data
    │   ├── domain
    │   ├── firebase
    │   ├── main.dart
    │   ├── pages
    │   ├── utils
    │   └── widgets
    ├── linux
    │   ├── .gitignore
    │   ├── CMakeLists.txt
    │   ├── flutter
    │   └── runner
    ├── macos
    │   ├── .gitignore
    │   ├── Flutter
    │   ├── Runner
    │   ├── Runner.xcodeproj
    │   ├── Runner.xcworkspace
    │   └── RunnerTests
    ├── pubspec.lock
    ├── pubspec.yaml
    ├── test
    │   └── widget_test.dart
    ├── web
    │   ├── favicon.png
    │   ├── icons
    │   ├── index.html
    │   └── manifest.json
    └── windows
        ├── .gitignore
        ├── CMakeLists.txt
        ├── flutter
        └── runner
```

---

### Project Index

<details open>
	<summary><b><code>AI-SOLUTION/</code></b></summary>
	<!-- __root__ Submodule -->
	<details>
		<summary><b>__root__</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ __root__</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/pubspec.yaml'>pubspec.yaml</a></b></td>
					<td style='padding: 8px;'>- Defines project metadata, dependencies, and assets for the Flutter-based AI solution, establishing the foundation for app functionality<br>- It integrates core packages like Firebase, Bloc, and media tools, enabling user authentication, real-time data management, multimedia handling, and navigation<br>- This configuration supports the development of a scalable, feature-rich mobile application centered on AI-driven features.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/analysis_options.yaml'>analysis_options.yaml</a></b></td>
					<td style='padding: 8px;'>- Defines static analysis and linting configurations to enforce coding standards and improve code quality across the Flutter project<br>- It guides the Dart analyzer to identify errors, warnings, and style issues, ensuring consistent, maintainable, and high-quality code throughout the codebase architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/firebase.json'>firebase.json</a></b></td>
					<td style='padding: 8px;'>- Defines Firebase project configuration, integrating web hosting, Firestore security rules, and cloud functions<br>- Facilitates deployment and routing for a Flutter web application, ensuring seamless connectivity between frontend, backend, and database services within the overall architecture<br>- Supports efficient project management by specifying build paths, ignore patterns, and environment-specific settings.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/README.md'>README.md</a></b></td>
					<td style='padding: 8px;'>- Establishes the foundational structure for a Flutter-based mobile application, guiding the development process and serving as the entry point for building user interfaces<br>- It provides essential resources and references to facilitate onboarding and development, ensuring a cohesive starting point for creating a scalable and maintainable app within the overall project architecture.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- test Submodule -->
	<details>
		<summary><b>test</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ test</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/test/widget_test.dart'>widget_test.dart</a></b></td>
					<td style='padding: 8px;'>- Provides a fundamental widget test verifying core app functionality by simulating user interactions and ensuring the counter updates correctly<br>- It ensures the Flutter applications main widget behaves as expected, serving as a basic validation of UI responsiveness and state management within the overall architecture.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- ios Submodule -->
	<details>
		<summary><b>ios</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ ios</b></code>
			<!-- Runner.xcodeproj Submodule -->
			<details>
				<summary><b>Runner.xcodeproj</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ ios.Runner.xcodeproj</b></code>
					<!-- project.xcworkspace Submodule -->
					<details>
						<summary><b>project.xcworkspace</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ ios.Runner.xcodeproj.project.xcworkspace</b></code>
							<!-- xcshareddata Submodule -->
							<details>
								<summary><b>xcshareddata</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ ios.Runner.xcodeproj.project.xcworkspace.xcshareddata</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings'>WorkspaceSettings.xcsettings</a></b></td>
											<td style='padding: 8px;'>- Configures workspace settings to disable preview features within the iOS project environment, ensuring a streamlined development experience<br>- It aligns the workspace with project preferences, contributing to consistent behavior across team members and maintaining focus on core development tasks without unnecessary visual distractions<br>- This setup supports efficient collaboration and project management within the iOS codebase.</td>
										</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<!-- Runner.xcworkspace Submodule -->
			<details>
				<summary><b>Runner.xcworkspace</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ ios.Runner.xcworkspace</b></code>
					<!-- xcshareddata Submodule -->
					<details>
						<summary><b>xcshareddata</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ ios.Runner.xcworkspace.xcshareddata</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/ios/Runner.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings'>WorkspaceSettings.xcsettings</a></b></td>
									<td style='padding: 8px;'>- Configures workspace settings to disable live previews within the iOS development environment, ensuring a streamlined and distraction-free development process<br>- This setting supports the overall project architecture by maintaining a consistent workspace environment, which enhances developer focus and productivity during app development and testing phases.</td>
								</tr>
							</table>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<!-- Runner Submodule -->
			<details>
				<summary><b>Runner</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ ios.Runner</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/ios/Runner/AppDelegate.swift'>AppDelegate.swift</a></b></td>
							<td style='padding: 8px;'>- Facilitates the integration of Flutter with iOS by initializing the app and registering necessary plugins during launch<br>- Ensures seamless startup and setup of Flutter modules within the iOS environment, serving as the primary entry point for app lifecycle management and plugin registration in the iOS architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/ios/Runner/Runner-Bridging-Header.h'>Runner-Bridging-Header.h</a></b></td>
							<td style='padding: 8px;'>- Facilitates integration between Flutter and native iOS components by bridging generated plugin registrations<br>- Ensures seamless communication and functionality extension within the iOS platform, supporting the overall architecture of the Flutter application<br>- This header file plays a crucial role in maintaining the interoperability and stability of the app’s native and cross-platform features.</td>
						</tr>
					</table>
					<!-- Assets.xcassets Submodule -->
					<details>
						<summary><b>Assets.xcassets</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ ios.Runner.Assets.xcassets</b></code>
							<!-- AppIcon.appiconset Submodule -->
							<details>
								<summary><b>AppIcon.appiconset</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ ios.Runner.Assets.xcassets.AppIcon.appiconset</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json'>Contents.json</a></b></td>
											<td style='padding: 8px;'>- Defines the app icon assets for iOS and iPadOS, specifying various image sizes and scales to ensure proper display across device types and resolutions<br>- Supports consistent branding and visual identity within the apps architecture by providing all necessary icon variants for different contexts, including marketing and app store presentation.</td>
										</tr>
									</table>
								</blockquote>
							</details>
							<!-- LaunchImage.imageset Submodule -->
							<details>
								<summary><b>LaunchImage.imageset</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ ios.Runner.Assets.xcassets.LaunchImage.imageset</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/ios/Runner/Assets.xcassets/LaunchImage.imageset/Contents.json'>Contents.json</a></b></td>
											<td style='padding: 8px;'>- Defines the launch screen assets for the iOS application, ensuring a consistent and visually appealing startup experience across all device sizes and resolutions<br>- Integrates multiple image scales to optimize display quality, contributing to the overall user interface architecture by providing a seamless initial impression during app launch.</td>
										</tr>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/ios/Runner/Assets.xcassets/LaunchImage.imageset/README.md'>README.md</a></b></td>
											<td style='padding: 8px;'>- Defines customizable launch screen assets for the iOS application, enabling visual branding and user experience personalization during app startup<br>- Integrates with the Flutter projects Xcode workspace to facilitate easy replacement of launch images, ensuring a seamless and branded initial impression aligned with the overall app architecture.</td>
										</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<!-- RunnerTests Submodule -->
			<details>
				<summary><b>RunnerTests</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ ios.RunnerTests</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/ios/RunnerTests/RunnerTests.swift'>RunnerTests.swift</a></b></td>
							<td style='padding: 8px;'>- Provides a foundational test structure for the iOS Runner application within the Flutter project, enabling validation of core functionalities<br>- Serves as a starting point for implementing unit tests to ensure stability and correctness of the app’s iOS-specific components, supporting overall code quality and reliability in the project’s architecture.</td>
						</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<!-- lib Submodule -->
	<details>
		<summary><b>lib</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ lib</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/main.dart'>main.dart</a></b></td>
					<td style='padding: 8px;'>- Initialize the applications core by setting up Firebase integration and launching the Flutter-based user interface<br>- It ensures seamless connectivity to backend services, enabling features like authentication, data storage, and real-time updates, thereby serving as the foundational entry point that orchestrates the apps startup process within the overall architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/app.dart'>app.dart</a></b></td>
					<td style='padding: 8px;'>- Orchestrates the applications core structure by initializing global state management through multiple Bloc providers, configuring routing, and setting up dependencies for various features<br>- Facilitates seamless navigation between user and admin interfaces while ensuring consistent data flow and state synchronization across the entire architecture<br>- Serves as the foundational entry point for the app’s reactive and modular design.</td>
				</tr>
			</table>
			<!-- config Submodule -->
			<details>
				<summary><b>config</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.config</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/config/firebase_options.dart'>firebase_options.dart</a></b></td>
							<td style='padding: 8px;'>- Defines platform-specific Firebase configuration options to facilitate seamless initialization of Firebase services across web and other supported platforms within the Flutter application<br>- Ensures that the app can correctly connect to Firebase projects, enabling features like authentication, messaging, and storage, while guiding reconfiguration for unsupported platforms<br>- Serves as a central configuration point aligning Firebase integration with the overall app architecture.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- firebase Submodule -->
			<details>
				<summary><b>firebase</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.firebase</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/firebase/firebase_admin_auth_repo.dart'>firebase_admin_auth_repo.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates administrator authentication by enabling secure login via email and password, while simultaneously recording authenticated admin user IDs in the Firebase Realtime Database<br>- Integrates Firebase Authentication and Database services to support user management within the applications architecture, ensuring admin access is properly tracked and managed across the system.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/firebase/firebase_feedback_repo.dart'>firebase_feedback_repo.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates storage of user feedback and ratings within the Firebase Realtime Database, integrating feedback submission into the overall application architecture<br>- Ensures feedback data is organized under specific nodes, supporting seamless data management and retrieval for user insights and analytics across the system.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/firebase/firebase_admin_repo.dart'>firebase_admin_repo.dart</a></b></td>
							<td style='padding: 8px;'>- Provides an interface for managing administrative data within the Firebase backend, including inquiries, solutions, feedback, ratings, galleries, and events<br>- Facilitates data retrieval, updates, and deletions to support the applications content management and operational workflows, ensuring seamless synchronization between the app and Firebase real-time database.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/firebase/firebase_events_repo.dart'>firebase_events_repo.dart</a></b></td>
							<td style='padding: 8px;'>- Provides access to promotional and upcoming event data stored in Firebase Realtime Database, enabling retrieval of event lists for application features<br>- Serves as a bridge between the app’s domain layer and Firebase, ensuring seamless integration of event information within the overall architecture<br>- Facilitates dynamic content updates by fetching real-time event data efficiently.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/firebase/firebase_gallery_repo.dart'>firebase_gallery_repo.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a Firebase-based implementation for retrieving gallery data within the applications architecture<br>- It facilitates fetching all gallery entries from the Firebase Realtime Database, enabling seamless integration of gallery content into the apps data layer<br>- This component ensures efficient data access and consistency across the system's gallery management features.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/firebase/firebase_landing_repo.dart'>firebase_landing_repo.dart</a></b></td>
							<td style='padding: 8px;'>- Provides an interface for fetching client data, current solutions, and previous solutions from Firebase Realtime Database, integrating backend data sources into the applications architecture<br>- Facilitates data retrieval for the landing or dashboard components, enabling seamless synchronization of client-related information within the overall system<br>- Supports efficient data access and error handling across core data entities.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/firebase/firebase_inquiry_repo.dart'>firebase_inquiry_repo.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates interaction with Firebase Realtime Database to retrieve and submit inquiry-related data, including countries and services, supporting the applications inquiry management functionality<br>- Integrates seamlessly within the broader architecture to enable data persistence and retrieval, ensuring users can access up-to-date information and submit inquiries efficiently.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/firebase/firebase_chatting_repo.dart'>firebase_chatting_repo.dart</a></b></td>
							<td style='padding: 8px;'>- Implements Firebase-based chat functionalities, enabling real-time messaging, chat list retrieval, and admin communication within the application<br>- Manages message exchange, chat room identification, and user chat metadata updates, facilitating seamless user-to-user and admin-to-user interactions<br>- Integrates Firebase Realtime Database to support scalable, synchronized chat experiences aligned with the overall app architecture.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- domain Submodule -->
			<details>
				<summary><b>domain</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.domain</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/domain/gallery_repo.dart'>gallery_repo.dart</a></b></td>
							<td style='padding: 8px;'>- Defines an abstract contract for retrieving gallery data within the application architecture<br>- Facilitates consistent access to gallery collections across different implementations, supporting the separation of concerns and promoting flexible data sourcing strategies in the overall system<br>- Ensures that any concrete repository adheres to the expected method for fetching gallery information.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/domain/events_repo.dart'>events_repo.dart</a></b></td>
							<td style='padding: 8px;'>- Defines a contract for retrieving upcoming events and promotional events within the applications architecture<br>- Serves as an abstraction layer that decouples data fetching logic from other components, enabling flexible implementation and integration of event data sources across the system<br>- Facilitates consistent access to event-related data throughout the codebase.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/domain/chatting_repo.dart'>chatting_repo.dart</a></b></td>
							<td style='padding: 8px;'>- Defines an abstract interface for managing chat functionalities within the application, facilitating message exchange between users and administrators, retrieving chat histories, and monitoring chat list updates<br>- Serves as a core component in the architecture to enable seamless real-time communication and data synchronization across the system.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/domain/landing_repo.dart'>landing_repo.dart</a></b></td>
							<td style='padding: 8px;'>- Defines an abstract repository interface for accessing client data, current solutions, and previous solutions within the application<br>- It centralizes data retrieval operations, facilitating consistent data access patterns and supporting dependency injection for the apps domain layer, thereby enabling seamless integration of data sources and promoting maintainability across the codebase.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/domain/admin_repo.dart'>admin_repo.dart</a></b></td>
							<td style='padding: 8px;'>- Defines the administrative data operations interface for managing inquiries, solutions, events, galleries, feedback, and ratings within the application<br>- Facilitates creation, retrieval, updating, and deletion of various content types, supporting the overall architecture by enabling backend data management and ensuring seamless administrative workflows across the platform.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/domain/admin_auth_repo.dart'>admin_auth_repo.dart</a></b></td>
							<td style='padding: 8px;'>- Defines an abstract interface for administrative authentication, enabling login functionality through Firebase Authentication<br>- Facilitates integration of admin login processes within the broader application architecture, ensuring a consistent approach to user credential validation and session management for administrative users across the codebase.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/domain/feedback_repo.dart'>feedback_repo.dart</a></b></td>
							<td style='padding: 8px;'>- Defines an abstract contract for feedback management within the architecture, enabling the submission of user feedback and ratings<br>- Serves as a key interface that facilitates decoupled interaction between the domain layer and data sources, ensuring consistent handling of feedback-related operations across the application<br>- This abstraction supports flexibility and testability in the overall system design.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/domain/inquiry_repo.dart'>inquiry_repo.dart</a></b></td>
							<td style='padding: 8px;'>- Defines the core interface for inquiry management within the application, facilitating data retrieval of countries and services, and enabling inquiry submissions<br>- Serves as a contract layer that abstracts data operations, supporting the overall architecture by ensuring consistent interaction with inquiry-related data sources across different implementations.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- constant Submodule -->
			<details>
				<summary><b>constant</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.constant</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/constant/images.dart'>images.dart</a></b></td>
							<td style='padding: 8px;'>- Defines a collection of mockup image URLs used for carousel displays within the application, supporting visual content presentation<br>- These constants facilitate consistent and centralized management of imagery, enhancing the user interfaces visual appeal and ensuring easy updates across the project’s architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/constant/colors.dart'>colors.dart</a></b></td>
							<td style='padding: 8px;'>- Defines a centralized color palette to ensure visual consistency across the application<br>- It provides a set of predefined color constants used throughout the project’s UI components, facilitating cohesive design and easy maintenance within the overall architecture<br>- This setup supports a unified look and feel, streamlining theme management across different screens and features.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- widgets Submodule -->
			<details>
				<summary><b>widgets</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.widgets</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/widgets/success_dialog.dart'>success_dialog.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a reusable success dialog component within the applications widget library, facilitating consistent user feedback for successful actions<br>- It displays a confirmation icon, a customizable message, and an acknowledgment button, integrating seamlessly into the overall architecture to enhance user experience and maintain design uniformity across the app.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/widgets/text_field.dart'>text_field.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a customizable text input widget for user data entry within the application, supporting validation, styling, and various input configurations<br>- Facilitates consistent user interface design and input validation across the project, ensuring reliable data collection and improved user experience within the overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/widgets/confirmation_widget.dart'>confirmation_widget.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a reusable confirmation dialog component within the Flutter application, enabling consistent user prompts for critical actions<br>- It displays a message with options to cancel or confirm, integrating seamlessly into the app’s navigation flow and enhancing user experience through standardized alert interactions across the codebase.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/widgets/error_dialog.dart'>error_dialog.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a reusable error dialog widget for consistent user feedback across the application<br>- It displays an error icon, message, and an acknowledgment button, facilitating clear communication of issues and user acknowledgment within the app’s UI architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/widgets/loading_widgets.dart'>loading_widgets.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a reusable loading indicator widget designed for seamless integration across the application’s user interface<br>- It visually communicates ongoing processes, such as data fetching or processing, enhancing user experience by signaling activity with a consistent Cupertino-style activity indicator styled in the project’s theme colors.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- pages Submodule -->
			<details>
				<summary><b>pages</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.pages</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/pages/landing_page.dart'>landing_page.dart</a></b></td>
							<td style='padding: 8px;'>- Render the main landing page interface, showcasing the companys AI solutions, client collaborations, and solution portfolios<br>- Integrates dynamic content such as current and previous AI solutions, client logos, and promotional visuals, facilitating user engagement and navigation through key offerings<br>- Serves as the central hub for presenting the companys AI capabilities and success stories within the overall application architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/pages/events_page.dart'>events_page.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a dynamic, user-friendly interface for exploring upcoming and promotional events<br>- Integrates Bloc state management to handle data loading, error states, and content display, ensuring seamless updates and visual feedback<br>- Facilitates engaging event browsing through interactive grids, detailed views, and animated effects, supporting the overall architecture of an event-centric platform.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/pages/faq_page.dart'>faq_page.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates user inquiries through a comprehensive form interface, capturing personal and service-related details<br>- Integrates with BLoC architecture to manage inquiry submission states, providing real-time feedback and ensuring seamless data handling within the applications architecture<br>- Serves as a key component for user engagement and data collection in the overall system.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/pages/about_page.dart'>about_page.dart</a></b></td>
							<td style='padding: 8px;'>- Provides an interactive About page integrating multimedia content, user feedback, and ratings within the application architecture<br>- Facilitates user engagement through embedded YouTube videos, feedback submission, and rating features, while leveraging Bloc for state management<br>- Enhances user trust and platform credibility by showcasing customer feedback and enabling direct input, aligning with the overall goal of delivering a user-centric, feedback-driven experience.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/pages/gallery_page.dart'>gallery_page.dart</a></b></td>
							<td style='padding: 8px;'>- Provides the user interface for displaying a companys visual gallery, integrating state management to handle loading, success, and error states<br>- It orchestrates the presentation of header information and a dynamic grid of gallery images with descriptions, enhancing user engagement through visual storytelling and ensuring a seamless experience within the overall application architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/pages/index_page.dart'>index_page.dart</a></b></td>
							<td style='padding: 8px;'>- The <code>index_page.dart</code> file serves as the central hub for the applications main user interface, orchestrating navigation across various sections such as About, Events, FAQ, Gallery, and Landing pages<br>- It manages core user interactions, including search and messaging functionalities, and integrates the chat feature through a dedicated Bloc (<code>MessageBloc</code>)<br>- This page acts as the primary entry point for users, facilitating seamless navigation, real-time communication, and dynamic UI updates within the app's architecture.</td>
						</tr>
					</table>
					<!-- admin Submodule -->
					<details>
						<summary><b>admin</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ lib.pages.admin</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/pages/admin/inquiy_panel.dart'>inquiy_panel.dart</a></b></td>
									<td style='padding: 8px;'>- This code defines an <strong>Inquiry Panel</strong> within the admin interface, serving as a centralized hub for managing user inquiries<br>- It facilitates viewing, updating, and deleting inquiries by leveraging multiple BLoC components to handle state management and business logic<br>- The panel provides administrators with an interactive UI to oversee inquiry workflows efficiently, ensuring smooth communication and data handling across the applications inquiry-related features.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/pages/admin/gallery_panel.dart'>gallery_panel.dart</a></b></td>
									<td style='padding: 8px;'>- Provides an administrative interface for managing company galleries within the application<br>- Facilitates viewing, adding, updating, and deleting gallery items through a user-friendly layout, integrating state management with Bloc pattern<br>- Enables efficient gallery content oversight, including detailed previews and bulk actions, supporting seamless content moderation and organization in the overall app architecture.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/pages/admin/current_solution_panel.dart'>current_solution_panel.dart</a></b></td>
									<td style='padding: 8px;'>- Provides an administrative interface for managing current solutions within the application<br>- Facilitates viewing, adding, updating, and deleting solutions through a user-friendly UI, leveraging Bloc for state management<br>- Ensures seamless interaction with solution data, supporting real-time updates and detailed solution insights, integral to the overall architecture for content management and user engagement.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/pages/admin/previous_solution_panel.dart'>previous_solution_panel.dart</a></b></td>
									<td style='padding: 8px;'>- The <code>lib/pages/admin/previous_solution_panel.dart</code> file serves as the core interface for managing and displaying previous solutions within the applications administrative section<br>- It facilitates viewing, adding, updating, and deleting previous solutions, integrating multiple Bloc components to handle state management and asynchronous operations<br>- This page enables administrators to efficiently oversee solution records, ensuring the data remains current and accurate, thereby supporting the overall architectures goal of providing a robust and user-friendly solution management system.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/pages/admin/promo_events_panel.dart'>promo_events_panel.dart</a></b></td>
									<td style='padding: 8px;'>- Provides an administrative interface for managing promotional events within the application<br>- Facilitates viewing, adding, updating, and deleting promotional event entries, with features like bulk selection and real-time data refresh<br>- Integrates with the applications state management to display event details dynamically, supporting efficient content moderation and updates in the overall architecture.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/pages/admin/admin_panel.dart'>admin_panel.dart</a></b></td>
									<td style='padding: 8px;'>- Provides the core administrative interface for user authentication and navigation within the platform<br>- Manages login, OTP verification, and dynamic rendering of various admin panels such as inquiries, chat, solutions, events, gallery, and feedback<br>- Facilitates secure access control and seamless switching between administrative functionalities, supporting the overall architectures modular and role-based management approach.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/pages/admin/chatting_panel.dart'>chatting_panel.dart</a></b></td>
									<td style='padding: 8px;'>- Facilitates real-time chat management within the admin interface by displaying live user conversations, enabling message exchange, and supporting user selection and deletion<br>- Integrates with the messaging backend to load user lists and message histories, providing a streamlined communication panel for overseeing and interacting with ongoing chats across the platform.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/pages/admin/feedback_and_rating_panel.dart'>feedback_and_rating_panel.dart</a></b></td>
									<td style='padding: 8px;'>- Provides an interactive admin interface for managing user feedback and ratings<br>- Facilitates viewing, refreshing, and selecting feedback entries and ratings, enabling efficient moderation and analysis within the applications broader feedback management architecture<br>- Integrates with BLoC state management to dynamically display real-time data updates.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/pages/admin/upcoming_events_panel.dart'>upcoming_events_panel.dart</a></b></td>
									<td style='padding: 8px;'>- Provides an administrative interface for managing upcoming events, enabling users to view, add, update, and delete event details<br>- Integrates with the applications state management to fetch and display event data dynamically, supporting bulk actions like selection and deletion<br>- Enhances user experience with loading indicators and detailed event views within the overall application architecture.</td>
								</tr>
							</table>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<!-- utils Submodule -->
			<details>
				<summary><b>utils</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.utils</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/utils/enums.dart'>enums.dart</a></b></td>
							<td style='padding: 8px;'>- Defines a set of validation types for user input, specifically email and phone number, facilitating consistent and centralized validation logic across the application<br>- Integrating these enums enhances input validation clarity and maintainability within the overall architecture, supporting reliable user data handling throughout the project.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/utils/translate_on_hover.dart'>translate_on_hover.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a reusable widget that adds a smooth, animated vertical translation effect on hover, enhancing user interaction within the Flutter application<br>- Integrates seamlessly into the overall UI architecture by enabling dynamic visual feedback, thereby improving the responsiveness and interactivity of interface elements across the project.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/utils/navigation_extension.dart'>navigation_extension.dart</a></b></td>
							<td style='padding: 8px;'>- Provides streamlined navigation utilities to simplify route management within the Flutter application<br>- Enhances code readability and consistency by offering concise methods for transitioning between screens and handling navigation actions<br>- Integrates seamlessly into the app’s architecture, promoting efficient user flow control and reducing boilerplate code across the codebase.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/utils/hover_extension.dart'>hover_extension.dart</a></b></td>
							<td style='padding: 8px;'>- Provides hover interaction enhancements within the Flutter web application by modifying cursor appearance and enabling animated movement effects<br>- Integrates seamlessly with the overall architecture to improve user experience through intuitive visual feedback and dynamic UI responses, supporting consistent and engaging interactions across the app’s widget hierarchy.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- BLoC Submodule -->
			<details>
				<summary><b>BLoC</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.BLoC</b></code>
					<!-- previous_solutions Submodule -->
					<details>
						<summary><b>previous_solutions</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ lib.BLoC.previous_solutions</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/previous_solutions/previous_solutions_events.dart'>previous_solutions_events.dart</a></b></td>
									<td style='padding: 8px;'>- Defines event classes for managing previous solutions within the applications state management system<br>- Facilitates fetching, adding, updating, and deleting previous solutions, enabling seamless interaction with solution data<br>- These events serve as the communication layer between the UI and business logic, supporting dynamic updates and consistent data handling across the project architecture.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/previous_solutions/previous_solutions_bloc.dart'>previous_solutions_bloc.dart</a></b></td>
									<td style='padding: 8px;'>- Manages state and operations for handling previous solutions within the application, including fetching, adding, updating, and deleting entries<br>- Facilitates seamless interaction between the user interface and backend repositories, ensuring data consistency and responsiveness in managing historical solutions for clients and administrators<br>- Supports the overall architecture by maintaining a clear separation of concerns and streamlined data flow.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/previous_solutions/previous_solutions_states.dart'>previous_solutions_states.dart</a></b></td>
									<td style='padding: 8px;'>- Defines state classes for managing the lifecycle and status of previous solutions within the application<br>- Facilitates tracking loading, success, and error states for fetching, adding, updating, and deleting previous solutions, supporting seamless state management and UI updates in the overall architecture.</td>
								</tr>
							</table>
						</blockquote>
					</details>
					<!-- inquiry Submodule -->
					<details>
						<summary><b>inquiry</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ lib.BLoC.inquiry</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/inquiry/inquiry_states.dart'>inquiry_states.dart</a></b></td>
									<td style='padding: 8px;'>- Defines a comprehensive set of state classes for managing inquiry-related workflows within the application<br>- Facilitates tracking of loading, success, and error states for operations such as fetching countries, services, submitting inquiries, and handling open, closed, updated, or deleted inquiries<br>- Supports seamless state management and UI updates across the inquiry lifecycle in the overall architecture.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/inquiry/inquiry_events.dart'>inquiry_events.dart</a></b></td>
									<td style='padding: 8px;'>- Defines inquiry-related events within the applications architecture, facilitating user submissions, administrative management, and filtering of inquiries<br>- Supports actions such as submitting new inquiries, fetching open or closed inquiries, applying search filters, updating existing inquiries, and deleting inquiries<br>- These events enable seamless interaction and state management for inquiry workflows across the system.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/inquiry/inquiry_bloc.dart'>inquiry_bloc.dart</a></b></td>
									<td style='padding: 8px;'>- Manages inquiry-related state transitions across the application, including fetching, submitting, updating, and deleting inquiries, as well as handling country and service data<br>- Facilitates seamless user interactions and administrative workflows by orchestrating data flow between repositories and UI components within the overall architecture.</td>
								</tr>
							</table>
						</blockquote>
					</details>
					<!-- events Submodule -->
					<details>
						<summary><b>events</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ lib.BLoC.events</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/events/events_states.dart'>events_states.dart</a></b></td>
									<td style='padding: 8px;'>- Defines state classes for managing various event-related workflows, including fetching, adding, updating, and deleting upcoming and promotional events<br>- Facilitates seamless state transitions and error handling within the applications event management architecture, ensuring consistent UI updates and user feedback across different event operations.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/events/events_events.dart'>events_events.dart</a></b></td>
									<td style='padding: 8px;'>- Defines event types for managing upcoming and promotional events within the applications architecture<br>- Facilitates triggering actions such as fetching, adding, updating, and deleting events, enabling seamless state management and interaction with event data across the system<br>- This structure supports organized event handling, ensuring consistent communication between the user interface and business logic layers.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/events/events_bloc.dart'>events_bloc.dart</a></b></td>
									<td style='padding: 8px;'>- Defines event management logic for upcoming and promotional events, including fetching, adding, updating, and deleting operations<br>- Facilitates communication between the UI and data repositories, ensuring state transitions reflect user actions and backend responses within the applications event-driven architecture<br>- Serves as a central hub for orchestrating event-related workflows across the codebase.</td>
								</tr>
							</table>
						</blockquote>
					</details>
					<!-- current_solutions Submodule -->
					<details>
						<summary><b>current_solutions</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ lib.BLoC.current_solutions</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/current_solutions/current_solutions_states.dart'>current_solutions_states.dart</a></b></td>
									<td style='padding: 8px;'>- Defines state classes for managing the lifecycle of current solutions, including loading, success, and error states across viewing, adding, updating, and deleting operations<br>- Facilitates consistent state handling within the applications architecture, enabling seamless UI updates and error management related to current solutions data.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/current_solutions/current_solutions_events.dart'>current_solutions_events.dart</a></b></td>
									<td style='padding: 8px;'>- Defines the set of events for managing current solutions within the applications state management architecture<br>- Facilitates fetching, adding, updating, and deleting solutions, enabling dynamic interaction with solution data<br>- Serves as a core component for orchestrating user actions and maintaining consistency across the solutions management workflow.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/current_solutions/current_solutions_bloc.dart'>current_solutions_bloc.dart</a></b></td>
									<td style='padding: 8px;'>- Manages the state and operations for current solutions within the application, including fetching, adding, updating, and deleting solutions<br>- Integrates with repositories to perform data persistence and retrieval, ensuring seamless synchronization between the user interface and backend data sources<br>- Facilitates dynamic management of solutions to support real-time updates and user interactions across the platform.</td>
								</tr>
							</table>
						</blockquote>
					</details>
					<!-- gallery Submodule -->
					<details>
						<summary><b>gallery</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ lib.BLoC.gallery</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/gallery/galllery_states.dart'>galllery_states.dart</a></b></td>
									<td style='padding: 8px;'>- Defines various state classes for managing gallery operations within the applications architecture<br>- Facilitates tracking of loading, success, and error states for fetching, adding, updating, and deleting galleries, enabling seamless state management and UI responsiveness across the gallery feature.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/gallery/gallery_bloc.dart'>gallery_bloc.dart</a></b></td>
									<td style='padding: 8px;'>- Manages gallery-related state transitions within the application, enabling fetching, adding, updating, and deleting gallery items through Bloc pattern<br>- Coordinates interactions between UI components and repositories, ensuring seamless data flow and consistent state updates for gallery management across the apps architecture.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/gallery/gallery_events.dart'>gallery_events.dart</a></b></td>
									<td style='padding: 8px;'>- Defines the set of events related to gallery management within the applications state architecture<br>- Facilitates actions such as fetching, adding, updating, and deleting gallery items, enabling dynamic interaction and synchronization of gallery data across the user interface and backend services<br>- Serves as a core component for orchestrating gallery-related workflows in the overall system.</td>
								</tr>
							</table>
						</blockquote>
					</details>
					<!-- clients Submodule -->
					<details>
						<summary><b>clients</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ lib.BLoC.clients</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/clients/client_states.dart'>client_states.dart</a></b></td>
									<td style='padding: 8px;'>- Defines state representations for managing client data and interactions within the application<br>- It facilitates tracking loading, success, and error conditions for client lists and individual client details, including image retrieval<br>- These states enable seamless UI updates and error handling, supporting the overall architectures goal of providing a responsive and robust client management experience.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/clients/client_events.dart'>client_events.dart</a></b></td>
									<td style='padding: 8px;'>- Defines event classes for client-related actions within the applications BLoC architecture, facilitating communication between the UI and business logic<br>- These events trigger data fetching processes, such as retrieving all clients or fetching a specific client by ID, enabling dynamic and responsive client management within the overall system.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/clients/client_bloc.dart'>client_bloc.dart</a></b></td>
									<td style='padding: 8px;'>- Defines BLoC components managing client data flow within the application<br>- Facilitates fetching and handling client lists and individual client details, coordinating state transitions based on data retrieval outcomes<br>- Integrates with the landing repository to ensure seamless data access, supporting reactive UI updates and robust error handling across the client-related features of the architecture.</td>
								</tr>
							</table>
						</blockquote>
					</details>
					<!-- chatting Submodule -->
					<details>
						<summary><b>chatting</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ lib.BLoC.chatting</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/chatting/chatting_states.dart'>chatting_states.dart</a></b></td>
									<td style='padding: 8px;'>- Defines the various states for managing messaging interactions within the chat feature, facilitating state transitions and error handling<br>- It supports the overall architecture by enabling consistent representation of messaging statuses, including initial, loading, success, and error conditions, thereby ensuring reliable communication flow and user feedback throughout the chat experience.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/chatting/chatting_events.dart'>chatting_events.dart</a></b></td>
									<td style='padding: 8px;'>- Defines the core event types for the chat functionality, enabling message sending and administrative communication within the applications architecture<br>- These events facilitate user interactions and admin interventions, serving as key triggers for the chat-related workflows managed by the BLoC pattern, thereby supporting real-time messaging and communication management across the platform.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/chatting/chatting_bloc.dart'>chatting_bloc.dart</a></b></td>
									<td style='padding: 8px;'>- Facilitates real-time messaging by managing message exchange, retrieval, and chat list updates within the applications architecture<br>- Integrates with Firebase for data storage and authentication, enabling seamless communication between users and administrators<br>- Acts as a central hub for handling chat events, maintaining message streams, and ensuring synchronized chat interactions across the platform.</td>
								</tr>
							</table>
						</blockquote>
					</details>
					<!-- feedback Submodule -->
					<details>
						<summary><b>feedback</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ lib.BLoC.feedback</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/feedback/feedback_events.dart'>feedback_events.dart</a></b></td>
									<td style='padding: 8px;'>- Defines the event types for managing feedback and ratings within the application, enabling user submissions and retrieval of feedback and rating data<br>- These events facilitate communication between the user interface and business logic, supporting the collection, display, and updating of feedback-related information to enhance user engagement and service quality.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/feedback/feedback_bloc.dart'>feedback_bloc.dart</a></b></td>
									<td style='padding: 8px;'>- Manages feedback and rating workflows within the application by handling submission, retrieval, and state management<br>- Facilitates user feedback collection, displays feedback and ratings data, and ensures seamless communication between the UI and data repositories, supporting overall user engagement and administrative oversight in the system architecture.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/feedback/feeeback_states.dart'>feeeback_states.dart</a></b></td>
									<td style='padding: 8px;'>- Defines state management structures for feedback and rating features, facilitating seamless UI updates during data loading, submission, and error handling<br>- Supports tracking feedback and ratings data, ensuring consistent user experience across the application’s feedback module within the overall architecture.</td>
								</tr>
							</table>
						</blockquote>
					</details>
					<!-- admin_auth Submodule -->
					<details>
						<summary><b>admin_auth</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ lib.BLoC.admin_auth</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/admin_auth/admin_auth_events.dart'>admin_auth_events.dart</a></b></td>
									<td style='padding: 8px;'>- Define and manage authentication-related events for the admin interface, facilitating login and OTP verification processes within the applications architecture<br>- These events serve as triggers for state transitions in the admin authentication flow, ensuring secure access control and seamless user experience during the login procedures.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/admin_auth/admin_auth_states.dart'>admin_auth_states.dart</a></b></td>
									<td style='padding: 8px;'>- Defines various authentication states for the admin user flow, managing transitions between initial, loading, verification, success, and failure scenarios<br>- Facilitates state management within the admin authentication process, ensuring clear communication of authentication status throughout the application<br>- Supports robust handling of user login, OTP verification, and session management within the overall architecture.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/lib/BLoC/admin_auth/admin_auth_bloc.dart'>admin_auth_bloc.dart</a></b></td>
									<td style='padding: 8px;'>- Facilitates admin authentication workflows by managing login and OTP verification processes within the applications architecture<br>- Coordinates state transitions to ensure secure access, leveraging email-based OTP validation to enhance security and user verification<br>- Integrates with the broader authentication system to maintain consistent user session management across the platform.</td>
								</tr>
							</table>
						</blockquote>
					</details>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<!-- web Submodule -->
	<details>
		<summary><b>web</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ web</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/web/manifest.json'>manifest.json</a></b></td>
					<td style='padding: 8px;'>- Defines the web applications metadata and visual identity for the Flutter-based project, enabling consistent branding and user experience across platforms<br>- It specifies app appearance, icons, and launch behavior, integrating seamlessly into the overall architecture to support a cohesive, standalone mobile and web presence.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/web/index.html'>index.html</a></b></td>
					<td style='padding: 8px;'>- Defines the entry point and foundational HTML structure for the web application, enabling seamless integration of Flutter-based UI components<br>- Sets up essential metadata, icons, and manifest references to support cross-platform compatibility and progressive web app features, ensuring the app is properly configured for deployment and user access within the overall project architecture.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- windows Submodule -->
	<details>
		<summary><b>windows</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ windows</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/windows/CMakeLists.txt'>CMakeLists.txt</a></b></td>
					<td style='padding: 8px;'>- Defines the build configuration and installation process for the Windows platform within the overall project architecture<br>- It orchestrates compilation settings, manages dependencies like Flutter, and ensures proper placement of runtime assets and libraries, enabling seamless development, testing, and deployment of the cross-platform AI solution.</td>
				</tr>
			</table>
			<!-- runner Submodule -->
			<details>
				<summary><b>runner</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ windows.runner</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/windows/runner/Runner.rc'>Runner.rc</a></b></td>
							<td style='padding: 8px;'>- Defines application metadata and visual resources for the Windows build of the project, ensuring consistent identification, branding, and versioning across the software ecosystem<br>- It integrates essential icons, version information, and legal details, supporting the overall architecture by facilitating proper system recognition and deployment of the Windows-specific components.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/windows/runner/flutter_window.cpp'>flutter_window.cpp</a></b></td>
							<td style='padding: 8px;'>- Facilitates the creation and management of a native Windows window integrated with Flutter, enabling seamless rendering of Flutter content within a Windows environment<br>- Handles window lifecycle events, manages the Flutter engine and view, and processes window messages to ensure proper display and interaction of Flutter-based UI components within the desktop application architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/windows/runner/flutter_window.h'>flutter_window.h</a></b></td>
							<td style='padding: 8px;'>- Defines a Flutter window within a Windows environment, serving as a container that hosts and manages a Flutter view<br>- Facilitates integration of Flutter UI components into native Windows applications by handling window creation, message processing, and lifecycle management of the embedded Flutter engine<br>- Acts as a bridge connecting the native Windows platform with Flutters rendering and logic.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/windows/runner/CMakeLists.txt'>CMakeLists.txt</a></b></td>
							<td style='padding: 8px;'>- Defines the build configuration for the Windows runner application, specifying source files, dependencies, and compile settings<br>- It orchestrates the compilation and linking process to produce the executable, integrating Flutter components and platform-specific libraries to enable a seamless Windows desktop experience within the overall project architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/windows/runner/win32_window.h'>win32_window.h</a></b></td>
							<td style='padding: 8px;'>- Defines a high DPI-aware Win32 window abstraction facilitating creation, display, and management of native Windows UI elements<br>- Enables customization of rendering and input handling through inheritance, while managing window lifecycle, messaging, and theming to support a responsive and adaptable user interface within the overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/windows/runner/main.cpp'>main.cpp</a></b></td>
							<td style='padding: 8px;'>- Initialize and launch the Windows desktop application by setting up the main event loop, creating the application window, and integrating Flutters rendering engine<br>- It manages the applications lifecycle, handles user interactions, and ensures proper startup and shutdown procedures within the overall architecture, enabling a seamless Flutter-based user interface on Windows.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/windows/runner/resource.h'>resource.h</a></b></td>
							<td style='padding: 8px;'>- Defines visual resources for the Windows runner, including application icons and UI element identifiers, supporting the overall architecture by enabling consistent and efficient resource management within the Windows environment<br>- Facilitates seamless integration of visual assets into the application, ensuring a cohesive user interface experience across the project.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/windows/runner/utils.cpp'>utils.cpp</a></b></td>
							<td style='padding: 8px;'>- Facilitates Windows-specific runtime support by creating and attaching a console for output, and manages command-line argument parsing and encoding conversions<br>- Ensures seamless integration between Windows system calls and Flutter engine requirements, enabling proper initialization and communication within the applications architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/windows/runner/runner.exe.manifest'>runner.exe.manifest</a></b></td>
							<td style='padding: 8px;'>- Defines the application manifest for the Windows runner executable, specifying DPI awareness and OS compatibility to ensure proper display scaling and support on Windows 10 and 11 environments<br>- It integrates with the overall architecture by enabling consistent user interface behavior and compatibility across supported Windows versions.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/windows/runner/utils.h'>utils.h</a></b></td>
							<td style='padding: 8px;'>- Provides utility functions to facilitate Windows process management and command-line handling within the project<br>- It enables creating console windows with redirected output for integrated process interaction, converting UTF-16 encoded strings to UTF-8, and retrieving command-line arguments in a standardized format<br>- These utilities support seamless integration and communication between the Flutter library and the Windows environment.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/windows/runner/win32_window.cpp'>win32_window.cpp</a></b></td>
							<td style='padding: 8px;'>- Implements a Win32 window management system tailored for Flutter on Windows, handling window creation, theming, DPI scaling, and message processing<br>- Facilitates seamless integration of native Windows UI elements with Flutter, ensuring proper window behavior, theme adaptation, and resource management within the overall architecture of the Flutter Windows embedding.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- flutter Submodule -->
			<details>
				<summary><b>flutter</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ windows.flutter</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/windows/flutter/generated_plugin_registrant.h'>generated_plugin_registrant.h</a></b></td>
							<td style='padding: 8px;'>- Facilitates the registration of Flutter plugins within the Windows platform, ensuring seamless integration of native functionalities into the Flutter application<br>- Serves as a crucial component in the plugin initialization process, enabling the app to recognize and utilize platform-specific features effectively<br>- Supports the overall architecture by maintaining organized plugin management during app startup.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/windows/flutter/CMakeLists.txt'>CMakeLists.txt</a></b></td>
							<td style='padding: 8px;'>- Defines the build process for integrating Flutters Windows SDK with custom C++ wrappers, orchestrating the compilation of core implementations, plugin interfaces, and engine components<br>- Facilitates seamless linkage between Flutters native library and platform-specific code, ensuring proper setup for Windows desktop applications utilizing Flutter, while automating build dependencies and configurations.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/windows/flutter/generated_plugins.cmake'>generated_plugins.cmake</a></b></td>
							<td style='padding: 8px;'>- Defines the integration of Flutter plugins for Windows within the build system, ensuring proper linkage and inclusion of core plugins such as firebase_auth, firebase_core, smart_auth, and url_launcher_windows<br>- Facilitates seamless plugin management and incorporation into the application binary, supporting the overall architecture by enabling platform-specific plugin functionality and dependencies.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/windows/flutter/generated_plugin_registrant.cc'>generated_plugin_registrant.cc</a></b></td>
							<td style='padding: 8px;'>- Registers platform-specific plugins for Windows within the Flutter application, enabling seamless integration of Firebase Authentication, Firebase Core, Smart Authentication, and URL launching functionalities<br>- This component ensures that the necessary plugin bindings are established during app initialization, facilitating smooth communication between Flutter and native Windows APIs across the entire codebase.</td>
						</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<!-- macos Submodule -->
	<details>
		<summary><b>macos</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ macos</b></code>
			<!-- Flutter Submodule -->
			<details>
				<summary><b>Flutter</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ macos.Flutter</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/macos/Flutter/GeneratedPluginRegistrant.swift'>GeneratedPluginRegistrant.swift</a></b></td>
							<td style='padding: 8px;'>- Registers platform-specific plugins for macOS, enabling seamless integration of Firebase services, media playback, web views, authentication, local storage, and device features within the Flutter application<br>- Facilitates communication between Flutter and native macOS functionalities, ensuring the apps extended capabilities operate smoothly across the platform.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- Runner Submodule -->
			<details>
				<summary><b>Runner</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ macos.Runner</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/macos/Runner/AppDelegate.swift'>AppDelegate.swift</a></b></td>
							<td style='padding: 8px;'>- Defines the application lifecycle behavior for the macOS Flutter app, ensuring proper termination after window closure and supporting secure state restoration<br>- Integrates Flutter with native macOS functionalities, facilitating seamless app operation within the overall architecture<br>- Acts as the entry point for managing app state and lifecycle events in the macOS environment.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/macos/Runner/DebugProfile.entitlements'>DebugProfile.entitlements</a></b></td>
							<td style='padding: 8px;'>- Defines security and runtime permissions for the macOS application during debugging, enabling features such as sandboxing, just-in-time compilation, and network server access<br>- This configuration ensures the app operates securely and effectively within the macOS environment while supporting development and testing workflows<br>- It integrates with the overall project architecture by maintaining necessary security protocols for a seamless debugging experience.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/macos/Runner/Release.entitlements'>Release.entitlements</a></b></td>
							<td style='padding: 8px;'>- Defines security permissions for the macOS application, specifically enabling sandboxing to restrict app capabilities and enhance security<br>- Integrates into the overall project architecture by ensuring the application operates within a controlled environment, safeguarding user data and system integrity during runtime<br>- This configuration is essential for maintaining compliance with macOS security standards.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/macos/Runner/MainFlutterWindow.swift'>MainFlutterWindow.swift</a></b></td>
							<td style='padding: 8px;'>- Defines the main application window for the macOS platform, integrating Flutter content within a native Cocoa environment<br>- It establishes the windows structure, embeds the Flutter view controller, and registers generated plugins, facilitating seamless communication between Flutter and native macOS components within the overall architecture.</td>
						</tr>
					</table>
					<!-- Assets.xcassets Submodule -->
					<details>
						<summary><b>Assets.xcassets</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ macos.Runner.Assets.xcassets</b></code>
							<!-- AppIcon.appiconset Submodule -->
							<details>
								<summary><b>AppIcon.appiconset</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ macos.Runner.Assets.xcassets.AppIcon.appiconset</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/macos/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json'>Contents.json</a></b></td>
											<td style='padding: 8px;'>- Defines the set of application icons for the macOS version, ensuring consistent visual branding across various display sizes and resolutions<br>- Integrates multiple icon assets into the project architecture, facilitating proper icon rendering and scaling within the macOS environment<br>- Supports a cohesive user experience by providing appropriately sized icons for different contexts and device displays.</td>
										</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<!-- RunnerTests Submodule -->
			<details>
				<summary><b>RunnerTests</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ macos.RunnerTests</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/macos/RunnerTests/RunnerTests.swift'>RunnerTests.swift</a></b></td>
							<td style='padding: 8px;'>- Provides a foundational test structure for the macOS Flutter application, enabling validation of the Runner components functionality within the overall project architecture<br>- Serves as a starting point for implementing unit tests that ensure the stability and correctness of the app’s core execution flow during development.</td>
						</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<!-- linux Submodule -->
	<details>
		<summary><b>linux</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ linux</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/linux/CMakeLists.txt'>CMakeLists.txt</a></b></td>
					<td style='padding: 8px;'>- Configures the build environment for a cross-platform desktop application leveraging Flutter and GTK, orchestrating compilation, dependency management, and resource bundling<br>- Ensures consistent build settings, integrates Flutter assets, and manages installation of runtime components, enabling a streamlined process for creating, testing, and deploying the application within a cohesive architecture.</td>
				</tr>
			</table>
			<!-- runner Submodule -->
			<details>
				<summary><b>runner</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ linux.runner</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/linux/runner/CMakeLists.txt'>CMakeLists.txt</a></b></td>
							<td style='padding: 8px;'>- Defines the build configuration for the Linux runner application, specifying source files, dependencies, and build settings<br>- It orchestrates the compilation process, ensuring the application integrates Flutter and GTK components, and applies standard build conventions to produce a functional executable aligned with the project’s architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/linux/runner/main.cc'>main.cc</a></b></td>
							<td style='padding: 8px;'>- Initialize and launch the application within the Linux environment, serving as the entry point for the software<br>- It orchestrates the creation of the main application instance and manages its execution flow, integrating the core application logic into the overall architecture to facilitate user interactions and process management.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/linux/runner/my_application.h'>my_application.h</a></b></td>
							<td style='padding: 8px;'>- Defines the MyApplication class as a GTK-based Flutter application, serving as the core entry point for initializing and managing the applications lifecycle within the Linux environment<br>- It encapsulates the creation process, enabling seamless integration of Flutters rendering engine with GTK, and facilitates the overall architecture by providing a standardized interface for application instantiation.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/linux/runner/my_application.cc'>my_application.cc</a></b></td>
							<td style='padding: 8px;'>- Defines the core application structure and lifecycle for an AI solution desktop app built with GTK and Flutter<br>- Manages window creation, platform-specific UI adjustments, and integrates Flutter rendering with plugin registration<br>- Facilitates command-line argument handling and ensures seamless startup, shutdown, and resource management within the Linux environment, enabling a cohesive user experience across different windowing systems.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- flutter Submodule -->
			<details>
				<summary><b>flutter</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ linux.flutter</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/linux/flutter/generated_plugin_registrant.h'>generated_plugin_registrant.h</a></b></td>
							<td style='padding: 8px;'>- Facilitates the registration of Flutter plugins within the Linux platform, ensuring seamless integration of plugins into the Flutter applications plugin registry<br>- Serves as a crucial component in the overall architecture by enabling dynamic plugin management and interoperability, thereby supporting the modular and extensible nature of the Flutter Linux environment.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/linux/flutter/CMakeLists.txt'>CMakeLists.txt</a></b></td>
							<td style='padding: 8px;'>- Defines the build process for integrating Flutters Linux library into the project, managing dependencies, and ensuring proper compilation of Flutter components<br>- Coordinates system-level dependencies, library linking, and backend setup to facilitate seamless Flutter runtime integration within the overall architecture<br>- Supports consistent build automation for Flutter-related functionalities in the Linux environment.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/linux/flutter/generated_plugins.cmake'>generated_plugins.cmake</a></b></td>
							<td style='padding: 8px;'>- Facilitates integration of Flutter plugins on Linux by dynamically including plugin modules and linking their libraries to the main application<br>- Ensures seamless incorporation of platform-specific functionalities such as smart authentication and URL launching, supporting the overall architectures modularity and extensibility for Flutter-based Linux applications.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/linux/flutter/generated_plugin_registrant.cc'>generated_plugin_registrant.cc</a></b></td>
							<td style='padding: 8px;'>- Registers platform-specific plugins for the Linux Flutter application, enabling seamless integration of functionalities such as smart authentication and URL launching<br>- It ensures that the appropriate plugin implementations are initialized and connected to the apps plugin registry, facilitating smooth communication between Flutter and native Linux components within the overall architecture.</td>
						</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<!-- android Submodule -->
	<details>
		<summary><b>android</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ android</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/android/settings.gradle.kts'>settings.gradle.kts</a></b></td>
					<td style='padding: 8px;'>- Defines plugin management and build configuration for the Android project, integrating Flutter SDK paths and repositories<br>- Facilitates consistent plugin application and setup across the codebase, ensuring proper linkage between Flutter and Android components<br>- Serves as a foundational configuration point that streamlines dependency resolution and plugin integration within the overall project architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/android/build.gradle.kts'>build.gradle.kts</a></b></td>
					<td style='padding: 8px;'>- Defines repository sources and configures build directories for all subprojects within the Android project, ensuring consistent dependency resolution and build environment setup<br>- Establishes a unified build structure, streamlining project organization and facilitating efficient build processes across the entire codebase.</td>
				</tr>
			</table>
			<!-- app Submodule -->
			<details>
				<summary><b>app</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ android.app</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/android/app/build.gradle.kts'>build.gradle.kts</a></b></td>
							<td style='padding: 8px;'>- Defines the Android build configuration for the AI solution Flutter project, specifying application identifiers, SDK versions, build types, and plugin integrations<br>- Ensures consistent compilation and packaging of the Android app within the overall architecture, facilitating seamless integration between Flutter and native Android components for deploying the AI-powered mobile application.</td>
						</tr>
					</table>
					<!-- src Submodule -->
					<details>
						<summary><b>src</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ android.app.src</b></code>
							<!-- profile Submodule -->
							<details>
								<summary><b>profile</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ android.app.src.profile</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/android/app/src/profile/AndroidManifest.xml'>AndroidManifest.xml</a></b></td>
											<td style='padding: 8px;'>- Declare internet permission essential for development activities such as communication with the Flutter tool, enabling features like hot reload and debugging<br>- Positioned within the AndroidManifest.xml, it integrates network access capabilities into the apps profile build, supporting seamless development workflows and ensuring the app can connect to external services during testing and debugging phases.</td>
										</tr>
									</table>
								</blockquote>
							</details>
							<!-- main Submodule -->
							<details>
								<summary><b>main</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ android.app.src.main</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/android/app/src/main/AndroidManifest.xml'>AndroidManifest.xml</a></b></td>
											<td style='padding: 8px;'>- Defines the main application configuration for the Android platform within a Flutter project, establishing the apps entry point, theme, and intent filters<br>- Facilitates seamless integration of Flutter UI with Android system features, ensuring proper launch behavior, theme application, and text processing capabilities across the apps architecture.</td>
										</tr>
									</table>
									<!-- kotlin Submodule -->
									<details>
										<summary><b>kotlin</b></summary>
										<blockquote>
											<div class='directory-path' style='padding: 8px 0; color: #666;'>
												<code><b>⦿ android.app.src.main.kotlin</b></code>
											<!-- com Submodule -->
											<details>
												<summary><b>com</b></summary>
												<blockquote>
													<div class='directory-path' style='padding: 8px 0; color: #666;'>
														<code><b>⦿ android.app.src.main.kotlin.com</b></code>
													<!-- example Submodule -->
													<details>
														<summary><b>example</b></summary>
														<blockquote>
															<div class='directory-path' style='padding: 8px 0; color: #666;'>
																<code><b>⦿ android.app.src.main.kotlin.com.example</b></code>
															<!-- ai_solution Submodule -->
															<details>
																<summary><b>ai_solution</b></summary>
																<blockquote>
																	<div class='directory-path' style='padding: 8px 0; color: #666;'>
																		<code><b>⦿ android.app.src.main.kotlin.com.example.ai_solution</b></code>
																	<table style='width: 100%; border-collapse: collapse;'>
																	<thead>
																		<tr style='background-color: #f8f9fa;'>
																			<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
																			<th style='text-align: left; padding: 8px;'>Summary</th>
																		</tr>
																	</thead>
																		<tr style='border-bottom: 1px solid #eee;'>
																			<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/android/app/src/main/kotlin/com/example/ai_solution/MainActivity.kt'>MainActivity.kt</a></b></td>
																			<td style='padding: 8px;'>- Defines the main entry point for the Android application within a Flutter project, enabling seamless integration of Flutters UI framework with native Android components<br>- It facilitates launching the app on Android devices, ensuring proper initialization and communication between Flutter and the underlying platform, thereby supporting the overall architecture of cross-platform functionality.</td>
																		</tr>
																	</table>
																</blockquote>
															</details>
														</blockquote>
													</details>
												</blockquote>
											</details>
										</blockquote>
									</details>
								</blockquote>
							</details>
							<!-- debug Submodule -->
							<details>
								<summary><b>debug</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ android.app.src.debug</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Ai-Solution/blob/master/android/app/src/debug/AndroidManifest.xml'>AndroidManifest.xml</a></b></td>
											<td style='padding: 8px;'>- Defines the necessary internet permission for development activities within the Android environment, enabling communication between the Flutter tool and the application during debugging, hot reload, and other development processes<br>- This setup facilitates seamless development workflows by ensuring the app can access network resources as needed for testing and debugging purposes within the overall project architecture.</td>
										</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
		</blockquote>
	</details>
</details>

---

## Getting Started

### Prerequisites

This project requires the following dependencies:

- **Programming Language:** Dart
- **Package Manager:** Pub, Cmake, Gradle

### Installation

Build Ai-Solution from the source and install dependencies:

1. **Clone the repository:**

    ```sh
    ❯ git clone https://github.com/LyNNxMooon/Ai-Solution
    ```

2. **Navigate to the project directory:**

    ```sh
    ❯ cd Ai-Solution
    ```

3. **Install the dependencies:**

**Using [pub](https://dart.dev/):**

```sh
❯ pub get
```
**Using [cmake](https://isocpp.org/):**

```sh
❯ cmake . && make
```
**Using [gradle](https://gradle.org/):**

```sh
❯ gradle build
```

### Usage

Run the project with:

**Using [pub](https://dart.dev/):**

```sh
dart {entrypoint}
```
**Using [cmake](https://isocpp.org/):**

```sh
./Ai-Solution
```
**Using [gradle](https://gradle.org/):**

```sh
gradle run
```

### Testing

Ai-solution uses the {__test_framework__} test framework. Run the test suite with:

**Using [pub](https://dart.dev/):**

```sh
pub run test
```
**Using [cmake](https://isocpp.org/):**

```sh
ctest
```
**Using [gradle](https://gradle.org/):**

```sh
gradle test
```

---

<div align="left"><a href="#top">⬆ Return</a></div>

---
