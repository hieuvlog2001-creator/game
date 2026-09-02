# Bus Traffic Fever — GitHub IPA Build

GitHub Actions-ready iOS project using the supplied reference screens.

## 1. Upload to GitHub
Create a repository, then upload the contents of this folder to the repository root.

## 2. Build
Open **Actions** → **Build Bus Traffic Fever IPA** → **Run workflow**.

The workflow uses a GitHub-hosted macOS runner, builds an iOS archive, creates an IPA and uploads it as a workflow artifact.

## 3. Unsigned vs signed IPA
If no Apple signing secrets are configured, the workflow creates:

`BusTrafficFever-unsigned.ipa`

This is useful for validating the build/package, but it is **not installable on a normal physical iPhone** because iOS requires code signing.

For an installable Ad Hoc IPA, add these GitHub repository secrets:

- `IOS_CERTIFICATE_BASE64` — base64 of your Apple Distribution `.p12`
- `IOS_CERTIFICATE_PASSWORD` — password for the `.p12`
- `IOS_PROVISIONING_PROFILE_BASE64` — base64 of the matching `.mobileprovision`
- `KEYCHAIN_PASSWORD` — any temporary keychain password
- `IOS_TEAM_ID` — your Apple Developer Team ID
- `IOS_PROVISIONING_PROFILE_NAME` — exact profile name
- `IOS_SIGNING_IDENTITY` — e.g. `Apple Distribution: Your Company (TEAMID)`

Then rerun the workflow. It will produce `BusTrafficFever.ipa`.

## 4. App behavior
The current starter reproduces the supplied splash/welcome/game screens and provides a simple PLAY/back interaction. It does **not** contain the original game's source code or complete gameplay engine.
