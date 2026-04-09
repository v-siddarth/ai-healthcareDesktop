# Structure Audit Step 2: Root-Level Import Audit and Quarantine Plan

Date: 2026-04-05
Scope: `lib/` root audit only. No behavior changes.

## Goal

Classify root-level files into:

- keep in place for now
- move later with controlled import updates
- quarantine candidates
- verify manually before touching

This step is intended to prevent accidental breakage during future cleanup.

## Root-Level File Classification

### A. Keep In Place For Now

These are active and used by the app today. They should not be moved until a dedicated migration step is prepared.

- `lib/main.dart`
- `lib/landing_page.dart`
- `lib/AuthSplash.dart`
- `lib/Check.dart`
- `lib/Provider.dart`
- `lib/StateProvider.dart`
- `lib/LogoutScreen.dart`
- `lib/karnudstelecomservice.dart`

### Why These Are Kept

#### `lib/Check.dart`

This file defines `HomePage`, which is imported by several active modules:

- `lib/Insurance/InsuranceDashBoardScreen.dart`
- `lib/External/CommonScreen.dart`
- `lib/screens/login_screen.dart`
- `lib/reception/ReceptionDashboard.dart`
- `lib/pharmacy/PharmacyDashboard.dart`
- `lib/AuthSplash.dart`
- `lib/pharmacy/CreateSalesScreen.dart`
- `lib/Nurse/NurseAdminDashboardScreen.dart`
- `lib/Admin/AdminDashboard.dart`
- `lib/Nurse/NurseDashBoardScreen.dart`
- `lib/Doctor/DoctorMainScreen.dart`

Assessment:

- The file name is poor, but it is central.
- Safe future destination could be something like `lib/app/home_page.dart`.
- Do not rename or move yet without a dedicated import migration.

#### `lib/Provider.dart`

Contains:

- `userTokenProvider`
- `userTypeProvider`

Used by:

- `lib/authProvider/auth_provider.dart`

Assessment:

- Small but active.
- Safe future destination could be `lib/providers/session_provider.dart`.

#### `lib/StateProvider.dart`

Contains active Riverpod state notifiers and providers for:

- doctor profile
- assigned patients
- labs
- admitted patients
- lab reports

Used by:

- `lib/authProvider/auth_provider.dart`
- `lib/Lab/LabScreen.dart`
- `lib/Doctor/DoctorPatientDetailScreen.dart`
- `lib/Doctor/AssignedPatientScreen.dart`
- `lib/Doctor/DoctorAdmittedPatientScreen.dart`

Assessment:

- Active and structurally important.
- Should eventually be split into feature-specific provider files.
- Must not be moved in a broad cleanup pass.

#### `lib/AuthSplash.dart`

Used by:

- `lib/landing_page.dart`

Assessment:

- Active entry transition for doctor/external doctor routing.
- Can be relocated later into an auth or app-routing folder, but not now.

#### `lib/LogoutScreen.dart`

Used by:

- `lib/Doctor/DoctorMainScreen.dart`

Assessment:

- Active but narrowly used.
- Could later move under `lib/auth/` or `lib/app/`.

#### `lib/karnudstelecomservice.dart`

Used by:

- `lib/Doctor/DoctorPatientDetailScreen.dart`

Assessment:

- File name is misleading, but the content is real connectivity monitoring logic.
- Safe future destination could be `lib/services/connectivity_status_service.dart`.
- Rename only in a dedicated step.

## B. Move Later, But Only With Verification

These files are likely valid app code, but their current placement is poor.

- `lib/AuthSplash.dart`
- `lib/LogoutScreen.dart`
- `lib/Provider.dart`
- `lib/StateProvider.dart`
- `lib/karnudstelecomservice.dart`

Recommended future destinations:

- `lib/auth/` for auth entry, logout, auth state helpers
- `lib/providers/` for app-wide providers
- `lib/services/` for connectivity monitoring
- `lib/app/` for app shell and root navigation widgets

## C. Quarantine Candidates

These files currently show no import usage in `lib/` and visually appear experimental, demo, test, or abandoned.

- `lib/Das.dart`
- `lib/PdfTest.dart`
- `lib/SearchBar.dart`
- `lib/Urltest.dart`
- `lib/Working.dart`
- `lib/auth.dart`
- `lib/gamm.dart`
- `lib/ged.dart`
- `lib/logoBook.dart`
- `lib/oet.dart`
- `lib/sds.dart`
- `lib/sp.dart`
- `lib/the.dart`

### Notes

#### Clearly Demo / Experimental

- `lib/Das.dart` — unrelated finance dashboard demo
- `lib/Urltest.dart` — PDF open test
- `lib/oet.dart` — pet adoption demo
- `lib/sds.dart` — sample assigned-patient table
- `lib/auth.dart` — commented-out auth experiment
- `lib/PdfTest.dart` — commented PDF experiment

#### Possibly Reusable Utility / Widget Code But Unowned

- `lib/SearchBar.dart`
- `lib/ged.dart`
- `lib/logoBook.dart`
- `lib/the.dart`

#### Likely Internal Experiment / Side Feature

- `lib/Working.dart`
- `lib/gamm.dart`
- `lib/sp.dart`

Assessment:

- These should not be deleted immediately.
- Safest next action is to move them later into a quarantine folder such as `lib/_legacy/` or `lib/_sandbox/` only after import verification and analyzer pass.

## D. Folder-Level Risk Around Reception

Current state:

- active folder: `lib/reception/`
- suspicious legacy folder: `lib/receptio/`

Observed use:

- active imports target `lib/reception/PatientDischarge.dart`
- no active imports found for `lib/receptio/PatientDischarge.dart`

Assessment:

- `lib/receptio/` should be treated as legacy until compared file-to-file.
- It is a strong cleanup target, but not in a blind deletion step.

## Safe Rules For Future File Moving

1. Never move more than one category at a time.
2. Never rename a root file and a folder in the same step.
3. After each move:
   - update imports
   - run `dart format`
   - run `flutter analyze`
4. For risky active files, move one file only per step.
5. For quarantine files, prefer move-before-delete.

## Recommended Next Cleanup Sequence

### Phase 1

Compare and resolve:

- `lib/core/theme/`
- `lib/files/`

No deletions. Decide canonical theme source first.

### Phase 2

Quarantine obvious demos and experiments:

- `Das.dart`
- `Urltest.dart`
- `oet.dart`
- `sds.dart`
- `auth.dart`
- `PdfTest.dart`

### Phase 3

Rename and relocate one active root file at a time:

- `Check.dart`
- `Provider.dart`
- `StateProvider.dart`
- `karnudstelecomservice.dart`

### Phase 4

Compare and remove legacy typo folder:

- `lib/receptio/`

## Recommended Immediate Next Step

Step 3 should be a theme-system audit:

- compare `lib/core/theme/` and `lib/files/`
- identify duplicates
- decide canonical folder
- create a no-risk consolidation plan before moving anything
