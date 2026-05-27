import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// Application title.
  ///
  /// In en, this message translates to:
  /// **'Op Po'**
  String get appTitle;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Find F&B shifts that fit your day'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Op Po connects students with verified cafes, restaurants, and event teams that need reliable help fast.'**
  String get welcomeSubtitle;

  /// No description provided for @onboardingHeroLabel.
  ///
  /// In en, this message translates to:
  /// **'F&B gig marketplace'**
  String get onboardingHeroLabel;

  /// No description provided for @candidateRole.
  ///
  /// In en, this message translates to:
  /// **'Find shifts'**
  String get candidateRole;

  /// No description provided for @employerRole.
  ///
  /// In en, this message translates to:
  /// **'Post a job'**
  String get employerRole;

  /// No description provided for @candidateMetric.
  ///
  /// In en, this message translates to:
  /// **'urgent shifts available today'**
  String get candidateMetric;

  /// No description provided for @employerMetric.
  ///
  /// In en, this message translates to:
  /// **'verified employers this week'**
  String get employerMetric;

  /// No description provided for @candidateJobsTitle.
  ///
  /// In en, this message translates to:
  /// **'Urgent jobs'**
  String get candidateJobsTitle;

  /// No description provided for @candidateDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Candidate dashboard'**
  String get candidateDashboardTitle;

  /// No description provided for @employerDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Employer dashboard'**
  String get employerDashboardTitle;

  /// No description provided for @urgentBadge.
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get urgentBadge;

  /// No description provided for @verifiedBadge.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get verifiedBadge;

  /// No description provided for @activeBadge.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get activeBadge;

  /// No description provided for @hourlyRateLabel.
  ///
  /// In en, this message translates to:
  /// **'Hourly rate'**
  String get hourlyRateLabel;

  /// No description provided for @locationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get locationLabel;

  /// No description provided for @shiftTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Shift time'**
  String get shiftTimeLabel;

  /// No description provided for @applyNow.
  ///
  /// In en, this message translates to:
  /// **'Apply now'**
  String get applyNow;

  /// No description provided for @notFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'Job not found'**
  String get notFoundTitle;

  /// No description provided for @dashboardGreeting.
  ///
  /// In en, this message translates to:
  /// **'Ready for your next shift?'**
  String get dashboardGreeting;

  /// No description provided for @nextShift.
  ///
  /// In en, this message translates to:
  /// **'Next shift'**
  String get nextShift;

  /// No description provided for @applications.
  ///
  /// In en, this message translates to:
  /// **'Applications'**
  String get applications;

  /// No description provided for @earnings.
  ///
  /// In en, this message translates to:
  /// **'Earnings'**
  String get earnings;

  /// No description provided for @popularShift.
  ///
  /// In en, this message translates to:
  /// **'Evening barista shifts are trending near District 1.'**
  String get popularShift;

  /// No description provided for @employerOpenRoles.
  ///
  /// In en, this message translates to:
  /// **'Open roles'**
  String get employerOpenRoles;

  /// No description provided for @employerPendingApplications.
  ///
  /// In en, this message translates to:
  /// **'Pending applications'**
  String get employerPendingApplications;

  /// No description provided for @employerCompletionRate.
  ///
  /// In en, this message translates to:
  /// **'Completion rate'**
  String get employerCompletionRate;

  /// No description provided for @dashboardCandidateTab.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardCandidateTab;

  /// No description provided for @jobsTab.
  ///
  /// In en, this message translates to:
  /// **'Jobs'**
  String get jobsTab;

  /// No description provided for @employerTab.
  ///
  /// In en, this message translates to:
  /// **'Employer'**
  String get employerTab;

  /// No description provided for @jobDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Job detail'**
  String get jobDetailTitle;

  /// No description provided for @postJob.
  ///
  /// In en, this message translates to:
  /// **'Post job'**
  String get postJob;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
