
# AppSource App AL-Go Setup Checklist

This checklist helps ensure your AL-Go for GitHub repository is correctly configured for AppSource App development and submission.

---

## 📂 Repository Structure
```
/
|-- Code Coverage Classic/           (Main app folder - adjust to your app name)
|   |-- app.json
|   |-- src/                         (AL files go here)
|   |-- .logo/                       (Logo files go here)
|       |-- YourLogo.png or .jpg
|-- .AL-Go/
|   |-- settings.json                (Critical for AL-Go pipeline config)
|-- .github/
|   |-- workflows/
|       |-- (default AL-Go workflows)
```

---

## ⚙️ .AL-Go/settings.json Example

```json
{
    "country": "us",
    "type": "AppSource App",
    "appFolders": ["Code Coverage Classic"],
    "testFolders": [],
    "bcptTestFolders": [],
    "appSourceCopAllowedRanges": [
        {
            "from": 72653575,
            "to": 72653579
        }
    ],
    "appSourceCopMandatoryAffixes": ["ERPD"]
}
```

---

## 📄 app.json Example Template

```json
{
    "id": "your-guid-here",
    "name": "Your App Name",
    "publisher": "Your Company Name",
    "version": "1.0.0.0",
    "brief": "Brief description of your app.",
    "description": "Full description of your app.",
    "privacyStatement": "https://yourdomain.com/privacy",
    "EULA": "https://yourdomain.com/eula",
    "help": "https://yourdomain.com/help",
    "url": "https://yourdomain.com",
    "logo": ".logo/YourLogo.png",
    "contextSensitiveHelpUrl": "https://yourdomain.com/help/context",
    "dependencies": [],
    "screenshots": [],
    "platform": "22.0.0.0",
    "application": "22.0.0.0",
    "idRanges": [
        {
            "from": 72653575,
            "to": 72653579
        }
    ],
    "features": [
        "NoImplicitWith",
        "TranslationFile"
    ],
    "applicationInsightsConnectionString": "InstrumentationKey=your-actual-key-here",
    "resourceExposurePolicy": {
        "allowDebugging": true,
        "allowDownloadingSource": false,
        "includeSourceInSymbolFile": false
    }
}
```

---

## ✅ Required Files Checklist
| File/Folder | Purpose |
|---|---|
| .AL-Go/settings.json | Controls how AL-Go works (type, folders, ranges, affixes) |
| app.json | App metadata & required info for AppSource |
| .logo/ folder | Contains the app logo |
| src/ folder | Contains all your AL files |
| .github/workflows/ | Contains AL-Go workflows (auto-created by AL-Go) |

---

## 📛 Object Naming Checklist (AppSource Cop)
| Object Type | Example Name |
|---|---|
| Table | ERPD MyCustomTable |
| Page | ERPD CustomerListPage |
| Page Extension | ERPD CustomerListExt |
| Codeunit | ERPD DataHandlerCU |

✅ Always start with the mandatory affix (e.g., ERPD).

---

## 🔗 Telemetry (Mandatory for AppSource)
- Application Insights must be set up in Azure.
- Add the connection string to app.json:
```json
"applicationInsightsConnectionString": "InstrumentationKey=xxxx-xxxx-xxxx-xxxx"
```

---

## 🧪 Tests (Optional, but good practice)
- Add test app(s) to `testFolders` if needed.
- Test objects also need to follow affix rules if you apply AppSourceCop.

---

## 📦 Licensing (Optional but recommended)
- If your app requires a license file, configure:
```json
"licenseFileUrlSecretName": "licenseFileUrl"
```

---

## 🛠️ Common Pitfalls to Avoid
❌ Forgetting to add `.AL-Go/settings.json`  
❌ Using the wrong `type` (AppSource App vs PTE)  
❌ Missing affix in object names  
❌ Logo in the wrong place  
❌ Forgetting to add Application Insights connection string  

---

## 🚀 Deployment Tip
Once set up, triggering AL-Go workflows will:
✅ Compile the app  
✅ Check AppSourceCop rules  
✅ Package everything into `.app` file  
✅ Optionally, auto-publish to AppSource (if enabled)

---

## 🧰 Future-Proofing Tip
Create a "starter template repo" with:
- Pre-configured `.AL-Go/settings.json`
- Pre-filled `app.json`
- Folder structure ready to go

This saves time for all future apps.

---
