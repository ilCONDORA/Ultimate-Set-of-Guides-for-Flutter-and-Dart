# Creating a Custom App Name and Package

When creating a new Flutter app, one of the first steps is choosing a name for your application. However, Flutter's default project setup doesn't fully customize all the necessary settings across different platforms. This guide will show you how to efficiently set up your app's name, package, and other important identifiers using the `package_rename` tool.

# WHY USE package_rename?

The `package_rename` package, [***link to pub.dev documentation***](https://pub.dev/packages/package_rename), allows you to easily customize about 20 different settings related to your app's identity across various platforms. It's more comprehensive and convenient than manually changing these settings or using other packages.

# INSTALLATION

Add `package_rename` to your `pubspec.yaml` file under `dev_dependencies`:

```yaml
dev_dependencies:
  package_rename: ^1.7.1# Use the latest version available
```

# CONFIGURATION

Create a configuration section in your `pubspec.yaml` file. Here's an example setup:

```yaml
# Run 'dart run package_rename' in the terminal to apply the new package information
package_rename_config:
  android:
    app_name: Really Cool App # (String) The display name of the android app
    package_name: it.ilcondora.reallycoolapp # (String) The package name of the android app
    override_old_package: # (Optional) (String) Use this to delete the old folder structure of MainActivity or to use the existing code with the new package name
    lang: kotlin # (Optional) (String) The android development language {kotlin(default) or java}

  ios:
    app_name: Really Cool App # (String) The display name of the ios app
    bundle_name: reallycoolapp # (String) The bundle name of the ios app
    package_name: it.ilcondora.reallycoolapp # (String) The product bundle identifier of the ios app

  linux:
    app_name: Really Cool App # (String) The window title of the linux app
    package_name: it.ilcondora.reallycoolapp # (String) The application id of the linux app
    exe_name: reallycoolapp-linux-x64 # (String) The executable name (binary name) of the linux app

  macos:
    app_name: Really Cool App # (String) The product name of the macos app
    package_name: it.ilcondora.reallycoolapp # (String) The product bundle identifier of the macos app
    copyright_notice: Copyright ©️ 2024 ilCONDORA. All rights reserved. # (String) The product copyright of the macos app

  web:
    app_name: Really Cool App # (String) The title of the web app and PWA
    short_app_name: # (String) The short display name of the PWA (Optional, defaults to app_name if not set)
    description: A really cool app to do really cool stuff # (String) The description of the web app and PWA

  windows:
    app_name: Really Cool App # (String) The window title & software name of the windows app
    organization: ilCONDORA # (String) The organization name (company name) of the windows app
    copyright_notice: Copyright ©️ 2024 ilCONDORA. All rights reserved. # (String) The legal copyright of the windows app
    exe_name: reallycoolapp-win64 # (String) The executable name (binary name) of the windows app
```

# APPLYING THE CHANGES

After setting up the configuration, run the following command in your terminal:

```powershell
dart run package_rename
```

This command will apply all the specified changes across your project files.

# VERIFICATION

After running the command, you'll see an output in the terminal detailing all the changes made. This output confirms that the package names, app names, and other identifiers have been updated across various platform-specific files. Here’s what you will see:

```powershell
Building package executable... 
Built package_rename:package_rename.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Android label set to: `Really Cool App` (main AndroidManifest.xml)
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
Android package set to: `it.ilcondora.reallycoolapp` (main AndroidManifest.xml)
Android package set to: `it.ilcondora.reallycoolapp` (debug AndroidManifest.xml)
Android package set to: `it.ilcondora.reallycoolapp` (profile AndroidManifest.xml)
Android applicationId set to: `it.ilcondora.reallycoolapp` (build.gradle)
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
iOS display name set to: `Really Cool App` (Info.plist)
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
iOS bundle name set to: `reallycoolapp` (Info.plist)
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
iOS bundle identifier set to: `it.ilcondora.reallycoolapp` (project.pbxproj)
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Linux app title set to: `Really Cool App` (my_application.cc)
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
Linux application id set to: `it.ilcondora.reallycoolapp` (CMakeLists.txt)
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
Linux binary name set to: `reallycoolapp-linux-x64` (CMakeLists.txt)
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
MacOS product name set to: `Really Cool App` (AppInfo.xcconfig)
MacOS buildable name set to: `Really Cool App` (Runner.xcscheme)
MacOS .app name set to: `Really Cool App.app` (project.pbxproj)
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
MacOS bundle id set to: `it.ilcondora.reallycoolapp` (AppInfo.xcconfig)
MacOS bundle id set to: `it.ilcondora.reallycoolapp` (project.pbxproj)
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
MacOS product copyright set to: `Copyright ©️ 2024 ilCONDORA. All rights reserved.` (ApppInfo.xcconfig)
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Web title set to: `Really Cool App` (index.html)
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
PWA name set to: `Really Cool App` (manifest.json)
PWA short name set to: `Really Cool App` (manifest.json)
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
Web description set to: `A really cool app to do really cool stuff` (index.html)       
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
PWA description set to: `A really cool app to do really cool stuff` (manifest.json)    
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Windows app title set to: `Really Cool App` (main.cpp)
Windows file description set to: `Really Cool App` (Runner.rc)
Windows internal name set to: `Really Cool App` (Runner.rc)
Windows product name set to: `Really Cool App` (Runner.rc)
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
Windows company name set to: `ilCONDORA` (Runner.rc)
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
Windows legal copyright set to: `Copyright ©️ 2024 ilCONDORA. All rights reserved.` (RunWindows legal copyright set to: `Copyright ©️ 2024 ilCONDORA. All rights reserved.` (Runnner.rc)
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
╔═════════════════════════════════════════════════════════════╗
║    🥳🥳🥳 Done! Now go ahead and build your app 🥳🥳🥳   ║
╚═════════════════════════════════════════════════════════════╝
```

# KNOWN ISSUES

For iOS and macOS, ensure that `PRODUCT_BUNDLE_IDENTIFIER` values for ***extensions*** in the project files are enclosed in double quotes (” ”) to prevent issues. `PRODUCT_BUNDLE_IDENTIFIER` is present in **ios/Runner.xcodeproj/project.pbxproj** and **macos/Runner.xcodeproj/project.pbxproj**.

The values that don’t need to be enclosed in double quotes (” ”) are `it.ilcondora.reallycoolapp` and `it.ilcondora.reallycoolapp.RunnerTests` .

# CONCLUSION

Using `package_rename` simplifies the process of customizing your Flutter app's identity across all supported platforms. It saves time and reduces the risk of missing important configuration files. Remember to run the package_rename command whenever you need to update these settings in your project.