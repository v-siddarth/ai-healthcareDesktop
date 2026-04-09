# Structure Audit Step 1

Date: 2026-04-05
Scope: Zero-risk structural audit only. No behavior changes.

## Overall Verdict

The project is functional and shippable, but the structure is not yet clean enough to be called production-grade from a maintenance and scaling perspective.

Main risks:

- Duplicate design-system/theme directories
- Inconsistent root-level file placement under `lib/`
- Extremely large feature files
- Typos and legacy naming
- Mixed ownership between generic folders and role-based folders

## Safe Findings

These are observations only and can be acted on later in controlled phases.

### 1. Duplicate Theme Systems

Two parallel theme/token folders exist:

- `lib/core/theme/`
- `lib/files/`

Current references found:

- `lib/screens/theme_showcase_screen.dart` imports `lib/core/theme/theme.dart`
- `lib/screens/tess.dart` imports `lib/files/theme.dart`
- `lib/screens/NurseRegister.dart` imports `lib/core/theme/google_fonts_compat.dart`
- `lib/reception/PatientAllDischargedScreen.dart` imports `lib/core/theme/google_fonts_compat.dart`

Assessment:

- `lib/core/theme/` appears to be the stronger long-term target.
- `lib/files/` looks like an older or parallel theme system.
- This should not be merged or deleted in one step.

### 2. Root-Level `lib/` Is Too Noisy

Current files directly under `lib/`:

- `AuthSplash.dart`
- `Check.dart`
- `Das.dart`
- `LogoutScreen.dart`
- `PdfTest.dart`
- `Provider.dart`
- `SearchBar.dart`
- `StateProvider.dart`
- `Urltest.dart`
- `Working.dart`
- `auth.dart`
- `camera.html`
- `gamm.dart`
- `ged.dart`
- `index.html`
- `karnudstelecomservice.dart`
- `landing_page.dart`
- `logoBook.dart`
- `main.dart`
- `oet.dart`
- `sds.dart`
- `sp.dart`
- `the.dart`

Assessment:

- `main.dart` and `landing_page.dart` are expected.
- `AuthSplash.dart`, `LogoutScreen.dart`, `Provider.dart`, `StateProvider.dart`, and `Check.dart` are active.
- Many others look experimental, temporary, legacy, or poorly named.

### 3. Active Root-Level Files That Must Be Treated As Risky

These are imported elsewhere and should not be moved casually:

- `lib/Check.dart`
- `lib/Provider.dart`
- `lib/StateProvider.dart`
- `lib/AuthSplash.dart`
- `lib/LogoutScreen.dart`
- `lib/karnudstelecomservice.dart`

### 4. Root-Level Files With No Import Hits In `lib/`

These may be dead, manual-run, or legacy files. They require manual verification before deletion or movement:

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

Note:

- “No import hits” does not prove they are unused. Some may be launched manually or referenced indirectly.

### 5. Typo / Legacy Folder Risk

Folders present:

- `lib/reception/`
- `lib/receptio/`

Current import hits show active use of:

- `lib/reception/PatientDischarge.dart`

No active imports found for:

- `lib/receptio/PatientDischarge.dart`

Assessment:

- `lib/receptio/` is likely legacy or accidental.
- Do not delete until content is manually compared and confirmed unused.

### 6. Large File Risk

Top oversized files:

- `lib/Doctor/DoctorPatientDetailScreen.dart` — 9311 lines
- `lib/pharmacy/PrescriptionScreen.dart` — 4693 lines
- `lib/reception/PatientAllDischargedScreen.dart` — 4189 lines
- `lib/reception/BillingAnalyticsDashboard.dart` — 3742 lines
- `lib/reception/IpdDetailScreen.dart` — 3362 lines
- `lib/reception/GenerateBillScreen.dart` — 3050 lines

Assessment:

- These files are the biggest production-maintainability risk in the repo.
- They should be split carefully into section widgets and helper files without changing logic.

## Performance / Production Suggestions

### High Value

- Keep one theme source of truth
- Split giant screens into smaller widgets
- Reduce rebuild scope in long stateful screens
- Move feature-specific widgets into local `widgets/` folders
- Add smoke tests for landing, auth, reception, and main dashboards

### Medium Value

- Standardize file naming
- Remove or quarantine legacy/demo files
- Strengthen lints after cleanup
- Replace broad root-level files with feature-owned locations

### Low Risk Wins

- Rename typo files only after import audit
- Group dialogs, widgets, and models under their owning feature
- Remove non-source clutter such as `.DS_Store`

## Proposed Safe Cleanup Sequence

1. Theme audit and decide canonical token folder
2. Root-level file classification: active vs legacy vs unknown
3. Compare `lib/reception/` and `lib/receptio/`
4. Create a no-delete quarantine plan for legacy files
5. Split one large screen at a time, starting with reception

## Recommended Next Step

Step 2 should be a root-level import audit and quarantine plan:

- confirm which root files are safe to move
- identify files that should remain in place for now
- prepare a no-risk migration order without deleting anything
