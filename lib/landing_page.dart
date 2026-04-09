import 'package:doctordesktop/Admin/AdminAuthDialod.dart';
import 'package:doctordesktop/auth/auth_splash_screen.dart';
import 'package:doctordesktop/External/CommonScreen.dart';
import 'package:doctordesktop/Insurance/InsuranceDashBoardScreen.dart';
import 'package:doctordesktop/Lab/LabDashBoard.dart';
import 'package:doctordesktop/Nurse/NurseAdminDashboardScreen.dart';
import 'package:doctordesktop/Nurse/NurseLoginScreen.dart';
import 'package:doctordesktop/constants/Assets.dart';
import 'package:doctordesktop/pharmacy/PharmacyDashboard.dart';
import 'package:doctordesktop/reception/ReceptionDashboard.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _processKey = GlobalKey();
  final GlobalKey _ecosystemKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollToKey(GlobalKey key) async {
    final context = key.currentContext;
    if (context == null) return;

    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      alignment: 0.08,
    );
  }

  void _openRoute(Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  void _showAdminAuth() {
    showDialog<void>(
      context: context,
      builder: (_) => const AdminAuthDialog(),
    );
  }

  void _showComingSoon(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$title panel is not connected yet.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final modules = [
      _LandingModule(
        title: 'Reception Panel',
        subtitle: 'Registration & front desk',
        icon: Icons.groups_2_rounded,
        color: const Color(0xFF4CAF50),
        onTap: () => _openRoute(const ReceptionDashBoard()),
      ),
      _LandingModule(
        title: 'Doctor',
        subtitle: 'Clinical workflow',
        icon: Icons.medical_services_rounded,
        color: const Color(0xFF9C27B0),
        isPremium: true,
        onTap: () => _openRoute(const AuthSplashScreen()),
      ),
      _LandingModule(
        title: 'External Doctor',
        subtitle: 'Appointments & referrals',
        icon: Icons.local_hospital_rounded,
        color: const Color(0xFF2E90E5),
        onTap: () => _openRoute(const SplashScreen1()),
      ),
      _LandingModule(
        title: 'Admin Nurse',
        subtitle: 'Nursing administration',
        icon: Icons.monitor_heart_rounded,
        color: const Color(0xFF00A896),
        onTap: () => _openRoute(const NurseAdminDashBoardScreen()),
      ),
      _LandingModule(
        title: 'Nurse',
        subtitle: 'Ward care operations',
        icon: Icons.personal_injury_rounded,
        color: const Color(0xFFFF9800),
        onTap: () => _openRoute(const NurseLoginScreen()),
      ),
      _LandingModule(
        title: 'Admin',
        subtitle: 'Control center',
        icon: Icons.admin_panel_settings_rounded,
        color: const Color(0xFF4A57C0),
        isPremium: true,
        onTap: _showAdminAuth,
      ),
      _LandingModule(
        title: 'Laboratory',
        subtitle: 'Reports & processing',
        icon: Icons.biotech_rounded,
        color: const Color(0xFF0E9B92),
        isPremium: true,
        onTap: () => _openRoute(const LabDashBoardScreen()),
      ),
      _LandingModule(
        title: 'Diagnostics',
        subtitle: 'Supervision tools',
        icon: Icons.tune_rounded,
        color: const Color(0xFF6C8A9E),
        onTap: () => _openRoute(const NurseAdminDashBoardScreen()),
      ),
      _LandingModule(
        title: 'Dialysis',
        subtitle: 'Coming soon',
        icon: Icons.water_drop_rounded,
        color: const Color(0xFF5B63C7),
        onTap: () => _showComingSoon('Dialysis'),
      ),
      _LandingModule(
        title: 'Pharmacy',
        subtitle: 'Inventory & sales',
        icon: Icons.local_pharmacy_rounded,
        color: const Color(0xFFFF4337),
        isPremium: true,
        onTap: () => _openRoute(const PharmacyDashBoard()),
      ),
      _LandingModule(
        title: 'Insurance',
        subtitle: 'Claims & approvals',
        icon: Icons.health_and_safety_rounded,
        color: const Color(0xFFE91E63),
        isPremium: true,
        onTap: () => _openRoute(const InsuranceDashBoardScreen()),
      ),
      _LandingModule(
        title: 'Patient',
        subtitle: 'Patient-side access',
        icon: Icons.person_rounded,
        color: const Color(0xFF2FA8C7),
        onTap: () => _showComingSoon('Patient'),
      ),
      _LandingModule(
        title: 'Equipment Management',
        subtitle: 'Assets & maintenance',
        icon: Icons.medical_information_rounded,
        color: const Color(0xFF00897B),
        onTap: () => _showComingSoon('Equipment Management'),
      ),
      _LandingModule(
        title: 'HR / Payroll',
        subtitle: 'People & payroll desk',
        icon: Icons.badge_rounded,
        color: const Color(0xFF8E5AF7),
        onTap: () => _showComingSoon('HR / Payroll'),
      ),
      _LandingModule(
        title: 'Support Team',
        subtitle: 'House keeping & ambulance',
        icon: Icons.support_agent_rounded,
        color: const Color(0xFFFB8C00),
        onTap: () => _showComingSoon('Support Team'),
      ),
      _LandingModule(
        title: 'Coming Soon',
        subtitle: 'Reserved for the next panel',
        icon: Icons.add_box_rounded,
        color: const Color(0xFF90A4AE),
        onTap: () => _showComingSoon('Upcoming Panel'),
      ),
    ];

    const processSteps = [
      _ProcessStep(
        number: '01',
        title: 'Registration',
        icon: Icons.app_registration_rounded,
        color: Color(0xFF48D7DB),
      ),
      _ProcessStep(
        number: '02',
        title: 'Documentation',
        icon: Icons.description_rounded,
        color: Color(0xFF48ED74),
      ),
      _ProcessStep(
        number: '03',
        title: 'Hospital Control',
        icon: Icons.local_hospital_rounded,
        color: Color(0xFF78BDF4),
      ),
      _ProcessStep(
        number: '04',
        title: 'Dashboard Access',
        icon: Icons.dashboard_rounded,
        color: Color(0xFF78E2DF),
      ),
    ];

    const featureCards = [
      _FeatureCardData(
        title: 'AI Diagnostics',
        subtitle: 'Coming Soon',
        description: 'Revolutionary AI-powered diagnostic assistance.',
        icon: Icons.psychology_alt_rounded,
        gradient: [Color(0xFF5A6FE6), Color(0xFF55B5F7)],
      ),
      _FeatureCardData(
        title: 'Mobile App',
        subtitle: 'On-the-Go',
        description: 'Access DocNex from anywhere with a unified workflow.',
        icon: Icons.phone_android_rounded,
        gradient: [Color(0xFF5DD86D), Color(0xFF74C365)],
      ),
      _FeatureCardData(
        title: 'Smart Reports',
        subtitle: 'Analytics+',
        description: 'Advanced insights and predictive operational trends.',
        icon: Icons.query_stats_rounded,
        gradient: [Color(0xFF24C4D8), Color(0xFF4A99F3)],
      ),
      _FeatureCardData(
        title: 'Cloud Backup',
        subtitle: 'Secure',
        description: 'Automatic data backup and recovery built in.',
        icon: Icons.cloud_done_rounded,
        gradient: [Color(0xFF6170EE), Color(0xFF8B7AF6)],
      ),
    ];

    const benefits = [
      'Ultra-fast clinical workflow with quick bars, voice and AI help.',
      '100% documentation accuracy with reduced manual effort.',
      'Built for Indian hospitals and real floor-level operations.',
      'A single connected ecosystem across departments.',
      'High intelligence with low effort adoption.',
      'Faster billing, fewer misses and cleaner coordination.',
    ];

    const problemItems = [
      _ProblemPoint('Slow documentation and doctor time waste', 1),
      _ProblemPoint('Staff mismanagement or untrained clerks', 2),
      _ProblemPoint('Billing confusion and revenue leakage', 3),
      _ProblemPoint('Missing reports and lost patient files', 4),
      _ProblemPoint('No coordination between departments', 5),
      _ProblemPoint('Nurses missing follow-ups', 6),
    ];

    return Scaffold(
      backgroundColor: _LandingPalette.page,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _HeroSection(
              onJoinForFree: () => _scrollToKey(_ecosystemKey),
              onWatchHowItWorks: () => _scrollToKey(_processKey),
            ),
            _SectionContainer(
              key: _processKey,
              child: const _ProcessSection(steps: processSteps),
            ),
            _SectionContainer(
              key: _ecosystemKey,
              child: _EcosystemSection(modules: modules),
            ),
            const _SectionContainer(
              child: _CoreFeaturesSection(featureCards: featureCards),
            ),
            const _SectionContainer(
              child: _UspSection(benefits: benefits),
            ),
            const _SectionContainer(
              bottomPadding: 96,
              child: _ProblemsSection(problemItems: problemItems),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({
    required this.onJoinForFree,
    required this.onWatchHowItWorks,
  });

  final VoidCallback onJoinForFree;
  final VoidCallback onWatchHowItWorks;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _LandingPalette.page,
      padding: const EdgeInsets.only(bottom: 48),
      child: Container(
        decoration: const BoxDecoration(
          color: _LandingPalette.heroBackground,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(1400, 180),
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1560),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(56, 28, 56, 76),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isCompact = constraints.maxWidth < 1100;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _HeroHeader(),
                        SizedBox(height: isCompact ? 36 : 48),
                        if (isCompact) ...[
                          _HeroCopy(
                            onJoinForFree: onJoinForFree,
                            onWatchHowItWorks: onWatchHowItWorks,
                            isCompact: true,
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            height: 470,
                            child: _HeroVisual(
                              onGetStarted: onJoinForFree,
                            ),
                          ),
                        ] else
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 510,
                                child: _HeroCopy(
                                  onJoinForFree: onJoinForFree,
                                  onWatchHowItWorks: onWatchHowItWorks,
                                  isCompact: false,
                                ),
                              ),
                              const SizedBox(width: 54),
                              Expanded(
                                child: SizedBox(
                                  height: 652,
                                  child: _HeroVisual(
                                    onGetStarted: onJoinForFree,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroHeader extends StatelessWidget {
  const _HeroHeader();

  @override
  Widget build(BuildContext context) {
    return const _BrandLogo();
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({
    required this.onJoinForFree,
    required this.onWatchHowItWorks,
    required this.isCompact,
  });

  final VoidCallback onJoinForFree;
  final VoidCallback onWatchHowItWorks;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final headlineSize = isCompact ? 42.0 : 54.0;
    final subheadSize = isCompact ? 18.0 : 17.0;
    final bodySize = isCompact ? 16.0 : 16.0;

    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(top: isCompact ? 0 : 58),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: headlineSize,
                  fontWeight: FontWeight.w800,
                  height: 1.16,
                  letterSpacing: -0.9,
                ),
                children: [
                  TextSpan(
                    text: 'Docnex ',
                    style: TextStyle(color: _LandingPalette.primary),
                  ),
                  TextSpan(
                    text: 'Healthcare\nEcosystem',
                    style: TextStyle(color: _LandingPalette.successText),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.86),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: Colors.white.withValues(alpha: 0.7)),
              ),
              child: const Text(
                'Built for Indian hospitals and modern care teams',
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                  color: _LandingPalette.primary,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Reinventing Hospitals with Intelligence, Speed & Automation',
              style: TextStyle(
                fontSize: subheadSize,
                fontWeight: FontWeight.w500,
                color: _LandingPalette.textMuted,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 22),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isCompact ? 560 : 500),
              child: Text(
                'A complete hospital operating system designed for Indian healthcare realities where doctors are overloaded, staff is undertrained, documentation is weak, and revenue leaks silently.',
                style: TextStyle(
                  fontSize: bodySize,
                  height: 1.75,
                  color: _LandingPalette.textBody,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 24,
              runSpacing: 14,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                _FilledCtaButton(
                  label: 'Get Started',
                  onTap: onJoinForFree,
                ),
                _WatchButton(onTap: onWatchHowItWorks),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroVisual extends StatelessWidget {
  const _HeroVisual({
    required this.onGetStarted,
  });

  final VoidCallback onGetStarted;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final visualWidth = constraints.maxWidth;
        final isCompact = visualWidth < 760;
        final imageWidth = isCompact ? visualWidth * 0.66 : visualWidth * 0.66;
        final imageRight = isCompact ? 0.0 : 18.0;
        final imageBottom = isCompact ? -18.0 : -36.0;
        final topLeftWidth = isCompact ? visualWidth * 0.5 : 264.0;
        final topRightWidth = isCompact ? visualWidth * 0.48 : 286.0;
        final bottomWidth = isCompact ? visualWidth * 0.52 : 288.0;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: imageRight,
              bottom: imageBottom,
              child: _LandingImage(
                path: 'assets/landing/hero_doctor.png',
                fit: BoxFit.contain,
                width: imageWidth.clamp(260.0, 520.0),
                fallbackHeight: isCompact ? 320 : 500,
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            Positioned(
              left: isCompact ? 8 : 8,
              top: isCompact ? 18 : 92,
              child: _MetricBadge(
                icon: Icons.medical_services_rounded,
                iconBackground: Color(0xFF23BDEE),
                title: '1,200+ Doctors Using Docnex',
                subtitle: 'Across Multi-Speciality Hospitals',
                width: topLeftWidth,
              ),
            ),
            Positioned(
              right: isCompact ? 0 : 0,
              top: isCompact ? 138 : 204,
              child: _MetricBadge(
                icon: Icons.auto_awesome_rounded,
                iconBackground: Color(0xFFF88C3D),
                title: '4× Faster Clinical Documentation',
                subtitle: 'With AI + Voice Automation',
                width: topRightWidth,
                trailingSuccess: true,
              ),
            ),
            Positioned(
              left: isCompact ? 12 : 84,
              bottom: isCompact ? 18 : 44,
              child: _JoinNowCard(
                isCompact: isCompact,
                onTap: onGetStarted,
                width: bottomWidth,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ProcessSection extends StatelessWidget {
  const _ProcessSection({
    required this.steps,
  });

  final List<_ProcessStep> steps;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1180;
        final isTablet = constraints.maxWidth >= 820;

        const heading = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How Docnex Operates?',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w800,
                color: _LandingPalette.primary,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Seeing, Understanding, Acting: How this Works in 4 Steps',
              style: TextStyle(
                fontSize: 20,
                height: 1.45,
                color: _LandingPalette.textSubtle,
              ),
            ),
          ],
        );

        if (isDesktop) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 320,
                child: heading,
              ),
              const SizedBox(width: 56),
              Expanded(
                child: Row(
                  children: [
                    for (var index = 0; index < steps.length; index++) ...[
                      Expanded(
                        child: _ArrowStepCard(
                          step: steps[index],
                          width: double.infinity,
                        ),
                      ),
                      if (index != steps.length - 1) const SizedBox(width: 16),
                    ],
                  ],
                ),
              ),
            ],
          );
        }

        if (isTablet) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 480,
                child: heading,
              ),
              const SizedBox(height: 34),
              Row(
                children: [
                  for (var index = 0; index < steps.length; index++) ...[
                    Expanded(
                      child: _ArrowStepCard(
                        step: steps[index],
                        width: double.infinity,
                      ),
                    ),
                    if (index != steps.length - 1) const SizedBox(width: 14),
                  ],
                ],
              ),
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heading,
            const SizedBox(height: 28),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: steps.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 24,
                childAspectRatio: 1.18,
              ),
              itemBuilder: (context, index) {
                return _ArrowStepCard(
                  step: steps[index],
                  width: double.infinity,
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _EcosystemSection extends StatelessWidget {
  const _EcosystemSection({
    required this.modules,
  });

  final List<_LandingModule> modules;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Complete Hospital Ecosystem',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 54,
            fontWeight: FontWeight.w800,
            color: _LandingPalette.primary,
            height: 1.18,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '4 x 4 panel grid for every department',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: _LandingPalette.textSubtle,
          ),
        ),
        const SizedBox(height: 44),
        LayoutBuilder(
          builder: (context, constraints) {
            final isDesktopGrid = constraints.maxWidth >= 1280;
            final crossAxisCount = isDesktopGrid
                ? 4
                : constraints.maxWidth > 1100
                    ? 3
                    : 2;
            final mainAxisExtent = isDesktopGrid
                ? 238.0
                : constraints.maxWidth > 1100
                    ? 230.0
                    : 222.0;

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: modules.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                mainAxisExtent: mainAxisExtent,
              ),
              itemBuilder: (context, index) {
                return _ModulePanelCard(module: modules[index]);
              },
            );
          },
        ),
      ],
    );
  }
}

class _CoreFeaturesSection extends StatelessWidget {
  const _CoreFeaturesSection({
    required this.featureCards,
  });

  final List<_FeatureCardData> featureCards;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Core System Features',
          style: TextStyle(
            fontSize: 52,
            fontWeight: FontWeight.w800,
            color: _LandingPalette.primary,
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'Advanced capabilities that power the entire ecosystem',
          style: TextStyle(
            fontSize: 22,
            color: _LandingPalette.textSubtle,
          ),
        ),
        const SizedBox(height: 42),
        LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 1280;

            if (isCompact) {
              return Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: featureCards.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1.22,
                    ),
                    itemBuilder: (context, index) {
                      return _FeaturePanelCard(feature: featureCards[index]);
                    },
                  ),
                  const SizedBox(height: 24),
                  const _WhatsComingNextCard(),
                ],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 11,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: featureCards.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1.2,
                    ),
                    itemBuilder: (context, index) {
                      return _FeaturePanelCard(feature: featureCards[index]);
                    },
                  ),
                ),
                const SizedBox(width: 28),
                const Expanded(
                  flex: 6,
                  child: _WhatsComingNextCard(),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _UspSection extends StatelessWidget {
  const _UspSection({
    required this.benefits,
  });

  final List<String> benefits;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 1240;

        if (isCompact) {
          return Column(
            children: [
              _UspCopy(benefits: benefits),
              const SizedBox(height: 30),
              const _UspMediaCard(),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 8,
              child: _UspCopy(benefits: benefits),
            ),
            const SizedBox(width: 46),
            const Expanded(
              flex: 7,
              child: _UspMediaCard(),
            ),
          ],
        );
      },
    );
  }
}

class _ProblemsSection extends StatelessWidget {
  const _ProblemsSection({
    required this.problemItems,
  });

  final List<_ProblemPoint> problemItems;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 1240;

        if (isCompact) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _ProblemsCopy(),
              const SizedBox(height: 30),
              _ProblemsTimeline(problemItems: problemItems),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 7,
              child: _ProblemsCopy(),
            ),
            const SizedBox(width: 40),
            Expanded(
              flex: 8,
              child: _ProblemsTimeline(problemItems: problemItems),
            ),
          ],
        );
      },
    );
  }
}

class _ProblemsCopy extends StatelessWidget {
  const _ProblemsCopy();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What problems Docnex Solves',
          style: TextStyle(
            fontSize: 46,
            fontWeight: FontWeight.w800,
            color: _LandingPalette.primary,
            height: 1.18,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Docnex is built for hospital operations where documentation delays, billing misses, coordination gaps and follow-up failures quietly hurt care and revenue.',
          style: TextStyle(
            fontSize: 22,
            height: 1.6,
            color: _LandingPalette.textBody,
          ),
        ),
      ],
    );
  }
}

class _ProblemsTimeline extends StatelessWidget {
  const _ProblemsTimeline({
    required this.problemItems,
  });

  final List<_ProblemPoint> problemItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: _LandingPalette.border),
        boxShadow: const [
          BoxShadow(
            color: Color(0x140A4A70),
            blurRadius: 32,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        children: problemItems
            .asMap()
            .entries
            .map(
              (entry) => _ProblemTimelineItem(
                point: entry.value,
                showConnector: entry.key != problemItems.length - 1,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ProblemTimelineItem extends StatelessWidget {
  const _ProblemTimelineItem({
    required this.point,
    required this.showConnector,
  });

  final _ProblemPoint point;
  final bool showConnector;

  @override
  Widget build(BuildContext context) {
    final badgeColor = _problemColor(point.index);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: badgeColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                '${point.index}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            if (showConnector)
              Container(
                width: 4,
                height: 56,
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: _LandingPalette.border,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              point.label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 1.45,
                color: _LandingPalette.textStrong,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color _problemColor(int index) {
    switch (index) {
      case 1:
        return const Color(0xFF1DB6F2);
      case 2:
        return const Color(0xFF55C64F);
      case 3:
        return const Color(0xFFFFA726);
      case 4:
        return const Color(0xFFFF6F61);
      case 5:
        return const Color(0xFF7C6CF7);
      default:
        return const Color(0xFFFF7A1A);
    }
  }
}

class _UspCopy extends StatelessWidget {
  const _UspCopy({
    required this.benefits,
  });

  final List<String> benefits;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'OUR USP (Why Docnex is Different)',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: Color(0xFF17C3C7),
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'Docnex Is Not Just Software — It Is the Operating System of Your Hospital',
          style: TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.w800,
            color: _LandingPalette.textStrong,
            height: 1.24,
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          'Benefits :',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: _LandingPalette.primary,
          ),
        ),
        const SizedBox(height: 20),
        ...benefits.map(
          (benefit) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  margin: const EdgeInsets.only(top: 3),
                  decoration: const BoxDecoration(
                    color: Color(0xFF34C759),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    benefit,
                    style: const TextStyle(
                      fontSize: 20,
                      height: 1.5,
                      color: _LandingPalette.textBody,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _UspMediaCard extends StatelessWidget {
  const _UspMediaCard();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 640,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 210,
              height: 210,
              decoration: BoxDecoration(
                color: const Color(0xFF29D1D1),
                borderRadius: BorderRadius.circular(28),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                color: const Color(0xFF2BE27A),
                borderRadius: BorderRadius.circular(28),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 24, 30, 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(34),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x140A4A70),
                  blurRadius: 32,
                  offset: Offset(0, 16),
                ),
              ],
            ),
            padding: const EdgeInsets.all(18),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: const _LandingImage(
                    path: 'assets/images/admin20s.png',
                    fit: BoxFit.cover,
                    height: 460,
                    width: double.infinity,
                    fallbackHeight: 460,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                ),
                Container(
                  width: 84,
                  height: 84,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: _LandingPalette.primary,
                    size: 48,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WhatsComingNextCard extends StatelessWidget {
  const _WhatsComingNextCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: _LandingPalette.border),
        boxShadow: const [
          BoxShadow(
            color: Color(0x140A4A70),
            blurRadius: 32,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'What\'s Coming Next',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: _LandingPalette.primary,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Supportive products expanding around Docnex to reduce operational load even further.',
            style: TextStyle(
              fontSize: 18,
              height: 1.55,
              color: _LandingPalette.textBody,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              gradient: const LinearGradient(
                colors: [Color(0xFFEDF7FF), Color(0xFFF8FCFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Next wave additions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: _LandingPalette.textStrong,
                  ),
                ),
                SizedBox(height: 16),
                _BulletLine(text: 'Voice-assisted charting'),
                _BulletLine(text: 'Remote patient monitoring'),
                _BulletLine(text: 'Cross-panel analytics and alerts'),
                _BulletLine(text: 'Automation-first admin operations'),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Align(
            alignment: Alignment.centerLeft,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: _LandingPalette.primary,
                side: const BorderSide(color: _LandingPalette.primary),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
                textStyle: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: const Text('Request early access'),
            ),
          ),
        ],
      ),
    );
  }
}

class _BulletLine extends StatelessWidget {
  const _BulletLine({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: _LandingPalette.primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: _LandingPalette.textBody,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BrandLogo extends StatelessWidget {
  const _BrandLogo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 58,
          height: 58,
          child: _LandingImage(
            path: AppImages.logo,
            fit: BoxFit.contain,
            fallbackHeight: 58,
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Docnex',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            letterSpacing: -0.4,
          ),
        ),
      ],
    );
  }
}

class _FilledCtaButton extends StatelessWidget {
  const _FilledCtaButton({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(80),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: _LandingPalette.primaryButton,
            borderRadius: BorderRadius.circular(80),
            boxShadow: const [
              BoxShadow(
                color: Color(0x140A4A70),
                blurRadius: 24,
                offset: Offset(0, 12),
              ),
            ],
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _WatchButton extends StatelessWidget {
  const _WatchButton({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(80),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: _LandingPalette.secondary,
              size: 24,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'Watch how it works',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: _LandingPalette.textStrong,
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricBadge extends StatelessWidget {
  const _MetricBadge({
    required this.icon,
    required this.iconBackground,
    required this.title,
    required this.subtitle,
    required this.width,
    this.trailingSuccess = false,
  });

  final IconData icon;
  final Color iconBackground;
  final String title;
  final String subtitle;
  final double width;
  final bool trailingSuccess;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      constraints: const BoxConstraints(minHeight: 106),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x120A4A70),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: _LandingPalette.textStrong,
                    height: 1.22,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: _LandingPalette.textMuted,
                    height: 1.28,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
          if (trailingSuccess)
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Icon(
                Icons.check_circle_rounded,
                color: _LandingPalette.successGreen,
                size: 22,
              ),
            ),
        ],
      ),
    );
  }
}

class _JoinNowCard extends StatelessWidget {
  const _JoinNowCard({
    required this.isCompact,
    required this.onTap,
    required this.width,
  });

  final bool isCompact;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.fromLTRB(isCompact ? 14 : 16, isCompact ? 14 : 16,
          isCompact ? 14 : 16, isCompact ? 12 : 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x120A4A70),
            blurRadius: 16,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: const _LandingImage(
                  path: 'assets/images/main.png',
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                  fallbackHeight: 44,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '150+ Hospitals Digitized',
                      style: TextStyle(
                        fontSize: isCompact ? 15 : 16,
                        fontWeight: FontWeight.w800,
                        color: _LandingPalette.textStrong,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Across India',
                      style: TextStyle(
                        fontSize: isCompact ? 12.5 : 13,
                        color: _LandingPalette.textMuted,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: _FilledCtaButton(
              label: 'Get Started',
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}

class _ArrowStepCard extends StatelessWidget {
  const _ArrowStepCard({
    required this.step,
    required this.width,
  });

  final _ProcessStep step;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          step.number,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: _LandingPalette.primary,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: width,
          height: 96,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: ClipPath(
                  clipper: _ArrowCardClipper(),
                  child: Container(
                    color: step.color,
                    padding: const EdgeInsets.only(right: 28),
                    alignment: Alignment.center,
                    child: Icon(
                      step.icon,
                      color: Colors.white,
                      size: 34,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          step.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _LandingPalette.primary,
          ),
        ),
      ],
    );
  }
}

class _ModulePanelCard extends StatelessWidget {
  const _ModulePanelCard({
    required this.module,
  });

  final _LandingModule module;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _LandingPalette.border),
        boxShadow: [
          BoxShadow(
            color: module.color.withValues(alpha: 0.12),
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: module.onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 126,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              module.color,
                              module.color.withValues(alpha: 0.88),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                    if (module.isPremium)
                      const Positioned(
                        top: 0,
                        left: 0,
                        child: _PremiumRibbon(),
                      ),
                    Positioned(
                      left: 16,
                      top: 16,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(module.icon, color: module.color, size: 24),
                      ),
                    ),
                    Positioned(
                      right: -12,
                      bottom: -8,
                      child: Icon(
                        module.icon,
                        color: Colors.white.withValues(alpha: 0.12),
                        size: 78,
                      ),
                    ),
                    Positioned(
                      left: 18,
                      right: 18,
                      bottom: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            module.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Container(
                            width: 34,
                            height: 3,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.6),
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      module.subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.35,
                        color: _LandingPalette.textMuted,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Access panel',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: module.color,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 16,
                          color: module.color,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeaturePanelCard extends StatelessWidget {
  const _FeaturePanelCard({
    required this.feature,
  });

  final _FeatureCardData feature;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: feature.gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: feature.gradient.first.withValues(alpha: 0.14),
            blurRadius: 24,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -18,
            bottom: -22,
            child: Container(
              width: 132,
              height: 132,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      feature.icon,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5CE58),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const Text(
                      'NEW',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF6A4A00),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                feature.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                feature.subtitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFF3F8FF),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                feature.description,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.45,
                  color: Color(0xFFF1F6FF),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PremiumRibbon extends StatelessWidget {
  const _PremiumRibbon();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF9DB9D), Color(0xFFEABF56)],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(18),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.workspace_premium_rounded,
            size: 14,
            color: Color(0xFF694800),
          ),
          SizedBox(width: 6),
          Text(
            'PREMIUM',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.4,
              color: Color(0xFF694800),
            ),
          ),
        ],
      ),
    );
  }
}

class _LandingImage extends StatelessWidget {
  const _LandingImage({
    required this.path,
    required this.fit,
    this.width,
    this.height,
    this.fallbackHeight = 220,
    this.borderRadius,
  });

  final String path;
  final BoxFit fit;
  final double? width;
  final double? height;
  final double fallbackHeight;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final placeholder = Container(
      width: width,
      height: height ?? fallbackHeight,
      decoration: BoxDecoration(
        color: const Color(0xFFEAF4FB),
        borderRadius: borderRadius ?? BorderRadius.circular(24),
        border: Border.all(color: _LandingPalette.border),
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.image_outlined,
        size: 42,
        color: _LandingPalette.primary,
      ),
    );

    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      filterQuality: FilterQuality.high,
      errorBuilder: (_, __, ___) => placeholder,
    );
  }
}

class _SectionContainer extends StatelessWidget {
  const _SectionContainer({
    required this.child,
    this.bottomPadding = 90,
    super.key,
  });

  final Widget child;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1720),
        child: Padding(
          padding: EdgeInsets.fromLTRB(48, 0, 48, bottomPadding),
          child: child,
        ),
      ),
    );
  }
}

class _ArrowCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const arrowDepth = 34.0;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - arrowDepth, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width - arrowDepth, size.height)
      ..lineTo(0, size.height)
      ..lineTo(arrowDepth, size.height / 2)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _LandingModule {
  const _LandingModule({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
    this.isPremium = false,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool isPremium;
}

class _ProcessStep {
  const _ProcessStep({
    required this.number,
    required this.title,
    required this.icon,
    required this.color,
  });

  final String number;
  final String title;
  final IconData icon;
  final Color color;
}

class _FeatureCardData {
  const _FeatureCardData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.gradient,
  });

  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final List<Color> gradient;
}

class _ProblemPoint {
  const _ProblemPoint(this.label, this.index);

  final String label;
  final int index;
}

class _LandingPalette {
  static const Color page = Color(0xFFFFFFFF);
  static const Color heroBackground = Color(0xFFE9F6FF);
  static const Color primary = Color(0xFF2383E2);
  static const Color primaryButton = Color(0xFF4EA2D1);
  static const Color secondary = Color(0xFF4A46B7);
  static const Color successText = Color(0xFF7EA839);
  static const Color successGreen = Color(0xFF45C266);
  static const Color border = Color(0xFFE6EEF8);
  static const Color textStrong = Color(0xFF282828);
  static const Color textBody = Color(0xFF676767);
  static const Color textMuted = Color(0xFF545567);
  static const Color textSubtle = Color(0xFF999999);
}
