# Structure Audit Step 3: Theme System Audit

Date: 2026-04-05
Scope: Compare `lib/core/theme/` and `lib/files/` only. No behavior changes.

## Verdict

The project currently has two parallel theme systems:

- `lib/core/theme/`
- `lib/files/`

They are effectively duplicates for the shared theme/token files.

This is a maintainability risk because future UI work can easily update one theme folder while the app is still partially reading from the other.

## File-by-File Comparison

Matching files exist in both folders:

- `app_colors.dart`
- `app_radius.dart`
- `app_shadows.dart`
- `app_spacing.dart`
- `app_theme.dart`
- `app_typography.dart`
- `theme.dart`
- `theme_extensions.dart`
- `theme_provider.dart`

Additional file that exists only in `lib/core/theme/`:

- `google_fonts_compat.dart`

## Current Import Usage

### `lib/core/theme/` imports found

- `lib/screens/theme_showcase_screen.dart`
- `lib/screens/NurseRegister.dart`
- `lib/reception/PatientAllDischargedScreen.dart`

### `lib/files/` imports found

- `lib/screens/tess.dart`

## Assessment

### Canonical Candidate

`lib/core/theme/` should be the canonical theme folder.

Reason:

- It already contains everything in `lib/files/`
- It also contains `google_fonts_compat.dart`
- It is better named for long-term architecture
- Active feature code already references it

### Status of `lib/files/`

`lib/files/` appears to be an older duplicate theme/token directory, not the best long-term source of truth.

At the moment, direct app usage of `lib/files/` appears very limited.

## Risk Level

This is a low-to-medium risk cleanup area if handled carefully.

It is safer than moving active auth/provider/root files because:

- imports are limited
- the folders are nearly identical
- only one known active file uses `lib/files/theme.dart`

## Recommended Safe Consolidation Strategy

### Phase A: No-Behavior Import Normalization

1. Update `lib/screens/tess.dart` to import from `lib/core/theme/theme.dart`
2. Run `dart format`
3. Run `flutter analyze`

If that passes, all known in-repo theme imports will point to `lib/core/theme/`.

### Phase B: Hold, Do Not Delete Yet

After Phase A:

- keep `lib/files/` temporarily
- do not delete immediately
- confirm no hidden/manual references remain

### Phase C: Controlled Removal

Only after import normalization and verification:

1. re-scan imports for `package:doctordesktop/files/`
2. if zero results, remove `lib/files/`
3. run `dart format`
4. run `flutter analyze`

## What Not To Do

- Do not merge the folders manually line-by-line in one step
- Do not delete `lib/files/` before import normalization
- Do not touch theme values yet unless there is a UI-specific task

## Production-Level Recommendation

Use this single theme source of truth going forward:

- `lib/core/theme/theme.dart`

And prefer importing the barrel file rather than individual token files unless a focused import is necessary.

## Recommended Immediate Next Action

This is the first cleanup step I would actually execute:

1. switch `lib/screens/tess.dart` from `lib/files/theme.dart` to `lib/core/theme/theme.dart`
2. verify analyzer
3. then prepare `lib/files/` for later removal
