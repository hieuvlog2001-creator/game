# Bus Traffic Fever — GitHub iOS Build

This project includes a GitHub Actions workflow for building the iOS app on a macOS runner.

## Important

The workflow is intentionally written so that **GitHub Secrets are not referenced directly in a step-level `if:` expression**. GitHub does not allow the `secrets` context in that location. Instead, `HAS_SIGNING` is set once at workflow level and the steps use `env.HAS_SIGNING`.

## Quick build

1. Upload the contents of this folder to your GitHub repository.
2. Open **Actions**.
3. Select **Build Bus Traffic Fever IPA**.
4. Click **Run workflow**.
5. Open the completed run and download **BusTrafficFever-IPA** under Artifacts.

With no Apple signing secrets configured, the workflow produces `BusTrafficFever-unsigned.ipa` for build verification. It is not directly installable on a normal iPhone.

## Signed IPA

For an Ad Hoc signed IPA, configure these repository Actions secrets:

- `IOS_CERTIFICATE_BASE64`
- `IOS_CERTIFICATE_PASSWORD`
- `IOS_PROVISIONING_PROFILE_BASE64`
- `KEYCHAIN_PASSWORD`
- `IOS_TEAM_ID`
- `IOS_PROVISIONING_PROFILE_NAME`
- `IOS_SIGNING_IDENTITY`

The provisioning profile must match the bundle identifier `com.example.Bustrafficfever` (or the bundle identifier contained in the profile).
