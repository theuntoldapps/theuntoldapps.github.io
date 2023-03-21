---
layout: post
title: "How to get rid of Glance Android app"
date: 2023-03-21 08:47 +0530
categories: development
author: themythicalengineer
tags: android glance bloatware
comments: true
blogUid: f54e9647-aefa-4ead-bcbb-93e35089e078
---

First step is to install adb command line tools on your PC/laptop.
You can follow this guide: [How to install ADB on Windows, macOS, and Linux](https://www.xda-developers.com/install-adb-windows-macos-linux/)

List all packages and search for glance
```bash
adb shell pm list packages -f
```

If you're on linux or mac, you can try this command
```bash
adb shell pm list packages -f | grep glance
```

Command output:
```bash
package:/my_region/app/GLPictorial_Update/GLPictorial_Update.apk=com.glance.internet
```

Use the command below to uninstall glance app completely.
```bash
adb shell pm uninstall --user 0 com.glance.internet
```