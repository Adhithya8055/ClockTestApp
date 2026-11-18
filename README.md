# ClockTestApp for iPadOS

A modern live aviation clock app built in SwiftUI.

## Automated Builds via GitHub Actions
This repository automatically builds an unsigned `.ipa` package using GitHub Actions on macOS.

### How to Install with Sideloadly on Windows:
1. Go to the **Actions** tab of this repository.
2. Click on the latest workflow run.
3. Download the **ClockTest-IPA** artifact (it will download a zip containing `ClockTest.ipa`).
4. Plug your iPad into your Windows PC.
5. Open **Sideloadly**, drag `ClockTest.ipa` into it, enter your Apple ID, and click **Start**.
