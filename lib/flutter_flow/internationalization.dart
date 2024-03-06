import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'nikqy4qa': {
      'en': 'Current Location',
      'hi': '',
    },
    '8itcqrvl': {
      'en': 'Drop Location',
      'hi': '',
    },
    'lkpramck': {
      'en': 'Home',
      'hi': '',
    },
  },
  // my_rides
  {
    'eqjacwoa': {
      'en': 'Upcoming rides',
      'hi': '',
    },
    'eliak3yj': {
      'en': 'OTP -',
      'hi': '',
    },
    'e5l8afhd': {
      'en': 'Hello World',
      'hi': '',
    },
    'nym9eh5t': {
      'en': '4.8 Ratings',
      'hi': '',
    },
    'muiuprsr': {
      'en': 'PICKUP',
      'hi': '',
    },
    'a6lwnm27': {
      'en': 'DROP',
      'hi': '',
    },
    'l9xre8j4': {
      'en': 'Live Tracking',
      'hi': '',
    },
    'auzpidk6': {
      'en': 'Invoice',
      'hi': '',
    },
    'gfrb5y7o': {
      'en': 'No Bookings',
      'hi': '',
    },
    'q5365qh7': {
      'en': 'History',
      'hi': '',
    },
    'rdb9cuh1': {
      'en': '4.8 Ratings',
      'hi': '',
    },
    'eesv1w4z': {
      'en': 'PICKUP',
      'hi': '',
    },
    'sby5aykd': {
      'en': 'Journey started',
      'hi': '',
    },
    '44yv3rgq': {
      'en': 'DROP',
      'hi': '',
    },
    '0m22vnvg': {
      'en': 'Journey Completed',
      'hi': '',
    },
    '5zpi58o5': {
      'en': 'Invoice',
      'hi': '',
    },
    'kd005gh8': {
      'en': 'No Bookings',
      'hi': '',
    },
    'eyjxbr5c': {
      'en': 'My Rides',
      'hi': '',
    },
    '2kxa8xk4': {
      'en': 'My Rides',
      'hi': '',
    },
  },
  // profile_page
  {
    'p1uqkcb3': {
      'en': 'Notification Settings',
      'hi': '',
    },
    'x6u4n22t': {
      'en': 'Terms of Use',
      'hi': '',
    },
    'oejripgy': {
      'en': 'Language Select',
      'hi': '',
    },
    'gubxxed6': {
      'en': 'Support',
      'hi': '',
    },
    '0b8lhb48': {
      'en': 'Logout',
      'hi': '',
    },
    'eog7jrab': {
      'en': 'My Profile',
      'hi': '',
    },
    '1fyzhtw6': {
      'en': 'Profile',
      'hi': '',
    },
  },
  // notification_page
  {
    'h9ydh72f': {
      'en': 'Notifications',
      'hi': '',
    },
    'x4xmkhb4': {
      'en': 'Allow messages, calls etc  ',
      'hi': '',
    },
    'zym8t63f': {
      'en': 'Vibrate',
      'hi': '',
    },
    '38u4p9pb': {
      'en': 'Notify Me About',
      'hi': '',
    },
    'f1pt16g1': {
      'en': 'SMS Alerts',
      'hi': '',
    },
    '5vvmj0kd': {
      'en': 'Request For Access',
      'hi': '',
    },
    'v5pxl0bb': {
      'en': 'Notification Settings',
      'hi': '',
    },
    '5izum9bb': {
      'en': 'Home',
      'hi': '',
    },
  },
  // edit_profile_profile
  {
    '8bry9gug': {
      'en': 'Name',
      'hi': '',
    },
    'zlzjzpfn': {
      'en': '',
      'hi': '',
    },
    'dplthkbd': {
      'en': 'Residential Address',
      'hi': '',
    },
    'vqzg2xi7': {
      'en': '',
      'hi': '',
    },
    'ln3hqb6b': {
      'en': 'Office Address',
      'hi': '',
    },
    'jhmw6453': {
      'en': '',
      'hi': '',
    },
    '64gnjmub': {
      'en': 'Save Changes',
      'hi': '',
    },
    '2y8mwa7l': {
      'en': 'Edit Profile',
      'hi': '',
    },
  },
  // searchRoutesPage
  {
    'uv0jzej6': {
      'en': 'PICKUP',
      'hi': '',
    },
    '4b9dslzq': {
      'en': 'DROP',
      'hi': '',
    },
    '4oxdsc0o': {
      'en': 'Select',
      'hi': '',
    },
    '7h1ke23y': {
      'en': 'Explore Entire Route',
      'hi': '',
    },
    'v3x8gdwk': {
      'en': 'No Routes Available',
      'hi': '',
    },
    'an0zxsxw': {
      'en': 'Home',
      'hi': '',
    },
  },
  // RouteMapBookingPage
  {
    'ce76lyxv': {
      'en': 'PICKUP',
      'hi': '',
    },
    '72d1uuyl': {
      'en': 'DROP',
      'hi': '',
    },
    'fzag0fwj': {
      'en': 'Select Timing',
      'hi': '',
    },
    'b8wavlfk': {
      'en': 'Route Map',
      'hi': '',
    },
    '5ibda2ck': {
      'en': 'Home',
      'hi': '',
    },
  },
  // confirmRidePage
  {
    '7dauv6ij': {
      'en':
          'This shuttle is fitted with GPS & CCTV is enabled. Our drivers are trained & trusted, your safety is our topmost priority.',
      'hi': '',
    },
    'p2vpyhf8': {
      'en': 'PICKUP',
      'hi': '',
    },
    '67ia48ek': {
      'en': 'DROP',
      'hi': '',
    },
    '6qyek0fh': {
      'en': 'Explore Routes',
      'hi': '',
    },
    'wizmfuq5': {
      'en': 'Change Date',
      'hi': '',
    },
    'zu728326': {
      'en': 'Time Slots Available',
      'hi': '',
    },
    'qp4a497l': {
      'en': 'Pickup',
      'hi': '',
    },
    'bk8br7h0': {
      'en': 'AC Bus',
      'hi': '',
    },
    'jo2fltf9': {
      'en': 'You will reach by',
      'hi': '',
    },
    'h1vbz4ux': {
      'en': 'No Time Slots Available (Change Date)',
      'hi': '',
    },
    '0uv3l6pv': {
      'en': 'Confirm Ride',
      'hi': '',
    },
    'llru441t': {
      'en': 'Home',
      'hi': '',
    },
  },
  // buyPassPageBookingProcess
  {
    '20caebrw': {
      'en': 'PICKUP',
      'hi': '',
    },
    'slqibwjk': {
      'en': 'DROP',
      'hi': '',
    },
    '6qwm0pc6': {
      'en': 'Explore Routes',
      'hi': '',
    },
    'fjgmme9g': {
      'en': 'Choose your pass',
      'hi': '',
    },
    'f6z32gb4': {
      'en': 'Buy',
      'hi': '',
    },
    '6utvkx0a': {
      'en': 'Buy Pass',
      'hi': '',
    },
    'p0aplb4w': {
      'en': 'Home',
      'hi': '',
    },
  },
  // myPassPage
  {
    'ktc5noea': {
      'en': 'All',
      'hi': '',
    },
    'ou3exq7t': {
      'en': 'Active',
      'hi': '',
    },
    'ionpjkze': {
      'en': 'Expired',
      'hi': '',
    },
    '2dpdbnhq': {
      'en': 'Select Routes',
      'hi': '',
    },
    'adt1jrqt': {
      'en': 'START STOP',
      'hi': '',
    },
    'xvyzbzc4': {
      'en': 'END STOP',
      'hi': '',
    },
    'bjq4o510': {
      'en': 'Explore Entire Route',
      'hi': '',
    },
    'a56om7z5': {
      'en': 'Choose your pass',
      'hi': '',
    },
    's1buuz36': {
      'en': '   ',
      'hi': '',
    },
    'c2qcxjos': {
      'en': '₹638',
      'hi': '',
    },
    '7ol12pha': {
      'en': '₹575',
      'hi': '',
    },
    '1brf88eb': {
      'en': 'Buy',
      'hi': '',
    },
    'g9wjcjc2': {
      'en': 'Valid Till',
      'hi': '',
    },
    'x7mi1rjc': {
      'en': 'Total Rides',
      'hi': '',
    },
    'sn1oi5n6': {
      'en': 'Rides Used',
      'hi': '',
    },
    'odgdch3d': {
      'en': 'Rides Left',
      'hi': '',
    },
    'ojp7ctjk': {
      'en': 'Your Route',
      'hi': '',
    },
    'yaqdhuvy': {
      'en': 'START STOP',
      'hi': '',
    },
    '4vqw6gbt': {
      'en': 'END STOP',
      'hi': '',
    },
    'cbw429kv': {
      'en': 'Runs from 8:00 am till 10:30am (All Days)',
      'hi': '',
    },
    '76dlfyvt': {
      'en': 'Explore Entire Route',
      'hi': '',
    },
    'pd24jh3i': {
      'en': 'Invoice',
      'hi': '',
    },
    'dwbps6zt': {
      'en': 'You don’t have any passes right now!',
      'hi': '',
    },
    'rxl8iqmp': {
      'en': 'Enjoy discounted fares on our passes',
      'hi': '',
    },
    'w783f5tc': {
      'en':
          'Unused rides from expired pass gets carried forwards with new pass on same route',
      'hi': '',
    },
    'gymr8vr8': {
      'en':
          'Once expired, the carry forward pass can be renewed within 45 days only.',
      'hi': '',
    },
    'awtk4gsh': {
      'en': 'Post grace period expiry, unused rides won’t be carried forward.',
      'hi': '',
    },
    '5cb9cwcg': {
      'en': 'Explore & Buy Pass',
      'hi': '',
    },
    'cl9idwnm': {
      'en': 'Validity',
      'hi': '',
    },
    'f9lqbvs2': {
      'en': 'Expired',
      'hi': '',
    },
    'qvj72e5o': {
      'en': 'Total Rides',
      'hi': '',
    },
    'lg4gu8pk': {
      'en': 'Rides Used',
      'hi': '',
    },
    'jcm3p16c': {
      'en': 'Rides Left',
      'hi': '',
    },
    'ekjflutg': {
      'en': 'Your Route',
      'hi': '',
    },
    'exxujs6q': {
      'en': 'START STOP',
      'hi': '',
    },
    'wb71hcaz': {
      'en': 'END STOP',
      'hi': '',
    },
    'mk79unr2': {
      'en': 'Runs from 8:00 am till 10:30am (All Days)',
      'hi': '',
    },
    'k1dr78oa': {
      'en': 'Invoice',
      'hi': '',
    },
    'u1ai0ozd': {
      'en': 'My Pass',
      'hi': '',
    },
    '2tu52qzr': {
      'en': 'My Pass',
      'hi': '',
    },
  },
  // languageSelectPage
  {
    '34bzweu3': {
      'en': 'Language Settings',
      'hi': '',
    },
    '25cv1ldk': {
      'en': 'Select Language',
      'hi': '',
    },
    '8zrx6zgv': {
      'en': 'English',
      'hi': '',
    },
    '8hqcknj5': {
      'en': 'Hindi',
      'hi': '',
    },
    'o93obigc': {
      'en': 'My Pass',
      'hi': '',
    },
  },
  // RoutesPage
  {
    '6u4bizw4': {
      'en': 'PICKUP',
      'hi': '',
    },
    'xobwd9la': {
      'en': 'DROP',
      'hi': '',
    },
    '9t4i2ufd': {
      'en': 'Explore Entire Route',
      'hi': '',
    },
    '2np8rqgt': {
      'en': 'Routes',
      'hi': '',
    },
    'tl3wc9sf': {
      'en': 'Routes',
      'hi': '',
    },
  },
  // login_new
  {
    'kyxruran': {
      'en': 'Enter your Phone Number',
      'hi': '',
    },
    'rt6uohiz': {
      'en': 'We will send you a confirmation code',
      'hi': '',
    },
    '7ub0s8jk': {
      'en': '+91',
      'hi': '',
    },
    'tj0i2kaq': {
      'en': 'Enter your phone number',
      'hi': '',
    },
    'c1hg5ed5': {
      'en': 'Field is required',
      'hi': '',
    },
    '4jcfpxe1': {
      'en': 'Enter the full mobile number',
      'hi': '',
    },
    '5qfizho1': {
      'en': 'Invalid number type',
      'hi': '',
    },
    'k1rxz4j5': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'ycth4gej': {
      'en': 'Proceed',
      'hi': '',
    },
    'p6l4btv3': {
      'en': 'By logging in you’re agreeing to our ',
      'hi': '',
    },
    'u1xgv7oz': {
      'en': 'terms & conditions',
      'hi': '',
    },
    'okrgxbqf': {
      'en': 'Home',
      'hi': '',
    },
  },
  // otpPageNew
  {
    '7h63ztu5': {
      'en': 'Enter Verification Code',
      'hi': '',
    },
    'jamr33ps': {
      'en': 'Field is required',
      'hi': '',
    },
    '5zkz86zx': {
      'en': 'Don’t receive the OTP? ',
      'hi': '',
    },
    'rvevwuho': {
      'en': 'RESEND OTP',
      'hi': '',
    },
    'ekyrzsqx': {
      'en': 'Home',
      'hi': '',
    },
  },
  // completeSignupNew
  {
    'c9lqb4ks': {
      'en': 'Complete Sign Up',
      'hi': '',
    },
    '6cktf7e9': {
      'en': '',
      'hi': '',
    },
    'x9jkrbvx': {
      'en': 'Your full name',
      'hi': '',
    },
    '15v7jcau': {
      'en': '',
      'hi': '',
    },
    'eezr393g': {
      'en': 'Your Email Address',
      'hi': '',
    },
    'l1qufiq8': {
      'en': '',
      'hi': '',
    },
    'mjachpbk': {
      'en': 'Select Home Address',
      'hi': '',
    },
    'ev6ay279': {
      'en': '',
      'hi': '',
    },
    'i94qpeve': {
      'en': 'Office Address',
      'hi': '',
    },
    'rmh0nihq': {
      'en': 'Male',
      'hi': '',
    },
    '97ic1qd8': {
      'en': 'Female',
      'hi': '',
    },
    'nvzkaw28': {
      'en': 'Proceed',
      'hi': '',
    },
    'rswgj2po': {
      'en': 'Home',
      'hi': '',
    },
  },
  // supportPage
  {
    'lbr4s4ou': {
      'en': 'Tell us how we can help',
      'hi': '',
    },
    '6h43x7ru': {
      'en':
          'By clicking submit, you acknlowledge Aaveg may review  diagnastic and try to troubleshoot your problem and solve your reported issue',
      'hi': '',
    },
    'fosu0mb1': {
      'en': 'Submit',
      'hi': '',
    },
    'lk4xku4s': {
      'en': 'Talk to support agent',
      'hi': '',
    },
    '52l7lxig': {
      'en': 'Support',
      'hi': '',
    },
    'frbq1529': {
      'en': 'Home',
      'hi': '',
    },
  },
  // trackingPage
  {
    'a8lirwpy': {
      'en': 'Home',
      'hi': '',
    },
  },
  // searchPagePickup
  {
    'ur39hc93': {
      'en': 'Pick Up Location',
      'hi': '',
    },
    '0nov9b7j': {
      'en': 'Drop Location',
      'hi': '',
    },
    'xugm0xah': {
      'en': 'Current Location',
      'hi': '',
    },
    '6nuahxzn': {
      'en': 'Set Location on Map',
      'hi': '',
    },
    'xx0ctoz9': {
      'en': 'Set Location on Map',
      'hi': '',
    },
    '6j6jbg02': {
      'en': 'Search Routes',
      'hi': '',
    },
    '6nl0u3i2': {
      'en': 'Home',
      'hi': '',
    },
  },
  // setLocationOnMap
  {
    '83javc6o': {
      'en': 'Set your Destination',
      'hi': '',
    },
    's1hs9eq4': {
      'en': 'Search',
      'hi': '',
    },
    'kr7m42x8': {
      'en': 'Confirm Destination',
      'hi': '',
    },
    'xvv0sdau': {
      'en': 'Home',
      'hi': '',
    },
  },
  // TestingLiveTracking
  {
    'kyi5er09': {
      'en': 'Page Title',
      'hi': '',
    },
    'svoe3ld6': {
      'en': 'Home',
      'hi': '',
    },
  },
  // EntireRoutePage
  {
    '8g4h9pl0': {
      'en': 'PICKUP',
      'hi': '',
    },
    'bkoetuly': {
      'en': 'DROP',
      'hi': '',
    },
    '0u6ocedb': {
      'en': 'Route Map',
      'hi': '',
    },
    'v87jlsav': {
      'en': 'Home',
      'hi': '',
    },
  },
  // RouteBookingPage
  {
    'qo169zvi': {
      'en': 'Select Pick Up Stop',
      'hi': '',
    },
    'r1xcoam8': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'pcgh7t7d': {
      'en': 'Option 1',
      'hi': '',
    },
    '2xxhdgbw': {
      'en': 'Please select...',
      'hi': '',
    },
    'z8sb8c52': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '1ai5do70': {
      'en': 'Page Title',
      'hi': '',
    },
    'f3njj25g': {
      'en': 'Home',
      'hi': '',
    },
  },
  // searchPageDrop
  {
    'fxdoow8s': {
      'en': 'Pick Up Location',
      'hi': '',
    },
    '7eue6e0n': {
      'en': 'Drop Location',
      'hi': '',
    },
    'nx71fbda': {
      'en': 'Current Location',
      'hi': '',
    },
    'rq0ay5dk': {
      'en': 'Set Location on Map',
      'hi': '',
    },
    'tdkvv9ls': {
      'en': 'Set Location on Map',
      'hi': '',
    },
    'ovhp742o': {
      'en': 'Search Routes',
      'hi': '',
    },
    'lkkc0skk': {
      'en': 'Home',
      'hi': '',
    },
  },
  // ExploreRoutes
  {
    '33byuuy9': {
      'en': 'Explore all best routes to commute around Delhi NCR',
      'hi': '',
    },
    'bwl5v3x3': {
      'en': 'Explore all routes',
      'hi': '',
    },
  },
  // emergencySOS
  {
    '9vd48534': {
      'en': 'Emergency SOS',
      'hi': '',
    },
    '5xlu8iuj': {
      'en': 'Contact Support',
      'hi': '',
    },
    'b70dbho9': {
      'en': 'Women Support',
      'hi': '',
    },
    'sjaz3tzy': {
      'en': 'Report issue with current ride',
      'hi': '',
    },
    'apgwds3k': {
      'en': 'Report Issue',
      'hi': '',
    },
  },
  // reportanissue
  {
    'mux7pph9': {
      'en': 'Report Issue with current ride',
      'hi': '',
    },
    'okv6m99x': {
      'en': 'Shuttle arrived late',
      'hi': '',
    },
    't0jzdnr3': {
      'en': 'Chaos inside the shuttle',
      'hi': '',
    },
    'rh3utaws': {
      'en': 'Other issue',
      'hi': '',
    },
    'olate0i4': {
      'en': 'Describe your issue here...',
      'hi': '',
    },
    'krtu21x3': {
      'en': 'Report Issue',
      'hi': '',
    },
  },
  // makePaymentComponent
  {
    'o5xlznki': {
      'en': 'Make Payment',
      'hi': '',
    },
    'ev76yqz3': {
      'en': 'Selected pickup time & date',
      'hi': '',
    },
    'tyct8zs9': {
      'en': 'Price',
      'hi': '',
    },
    'zkhl4651': {
      'en': 'Seats',
      'hi': '',
    },
  },
  // tracking
  {
    '7uno11h0': {
      'en': 'Hello World',
      'hi': '',
    },
    'fc1apbxb': {
      'en': 'Hello World',
      'hi': '',
    },
  },
  // invoiceEmail
  {
    'y8kyuwsz': {
      'en': 'Email on which the invoice will be sent :-',
      'hi': '',
    },
    'py80mauv': {
      'en': 'Enter your email here..',
      'hi': '',
    },
    '992kbvd4': {
      'en': 'Send',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'rhiiqm58': {
      'en': 'Pick Up Location',
      'hi': '',
    },
    '1p9qoaf8': {
      'en': 'Label here...',
      'hi': '',
    },
    'p32u155f': {
      'en': '',
      'hi': '',
    },
    '79je3mdu': {
      'en': '',
      'hi': '',
    },
    'ivgg2kev': {
      'en': 'This app requires your current location',
      'hi': '',
    },
    'hkgmh27z': {
      'en': 'Location is Required for your current location',
      'hi': '',
    },
    'sonic634': {
      'en': 'Allow Notifications',
      'hi': '',
    },
    'iabrho4c': {
      'en': '',
      'hi': '',
    },
    '9h20e4i7': {
      'en': '',
      'hi': '',
    },
    'vsni6pn9': {
      'en': '',
      'hi': '',
    },
    't96vkdyr': {
      'en': '',
      'hi': '',
    },
    'cylg3qyi': {
      'en': '',
      'hi': '',
    },
    'al3oz25y': {
      'en': '',
      'hi': '',
    },
    'j29az859': {
      'en': '',
      'hi': '',
    },
    'in8ho0z3': {
      'en': '',
      'hi': '',
    },
    '5rgyajoe': {
      'en': '',
      'hi': '',
    },
    'mc6eimgw': {
      'en': '',
      'hi': '',
    },
    '48pslm3f': {
      'en': '',
      'hi': '',
    },
    'lmqr1p4k': {
      'en': '',
      'hi': '',
    },
    'hnqyz679': {
      'en': '',
      'hi': '',
    },
    'u7yv1qxq': {
      'en': '',
      'hi': '',
    },
    '6rrqgk3h': {
      'en': '',
      'hi': '',
    },
    'mbqeyzai': {
      'en': '',
      'hi': '',
    },
    'sq5rn4w6': {
      'en': '',
      'hi': '',
    },
    'zvllfnof': {
      'en': '',
      'hi': '',
    },
    'sxk84ws9': {
      'en': '',
      'hi': '',
    },
    '6kpanpsf': {
      'en': '',
      'hi': '',
    },
    'nvx2flx2': {
      'en': '',
      'hi': '',
    },
    'y594vilf': {
      'en': '',
      'hi': '',
    },
    'g58x2mzm': {
      'en': '',
      'hi': '',
    },
    'nq5aftou': {
      'en': '',
      'hi': '',
    },
    'vg4imjb5': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
