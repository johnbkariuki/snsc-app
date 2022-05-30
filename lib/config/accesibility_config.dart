bool darkMode = false;
bool fontRegular = true;
bool fontDyslexic = false;
bool fontLegible = false;

class Preferences {
  // dark mode
  static bool usingDarkMode() {
    return darkMode;
  }

  static setDarkMode() {
    darkMode = true;
  }

  static setLightMode() {
    darkMode = false;
  }

  // fonts
  static String useFont() {
    if (fontRegular) {
      return "regular";
    }
    if (fontDyslexic) {
      return "dyslexic";
    }
    if (fontLegible) {
      return "legible";
    }
    return "";
  }

  static setRegularFont() {
    fontRegular = true;
    fontDyslexic = false;
    fontLegible = false;
  }

  static setDyslexicFont() {
    fontRegular = false;
    fontDyslexic = true;
    fontLegible = false;
  }

  static setLegibleFont() {
    fontRegular = false;
    fontDyslexic = false;
    fontLegible = true;
  }

  static String currentFont() {
    if (Preferences.useFont() == "regular") {
      return "Regular Font";
    }
    if (Preferences.useFont() == "dyslexic") {
      return "Dyslexic Font";
    }
    if (Preferences.useFont() == "legible") {
      return "Legible Font";
    } else {
      return "";
    }
  }
}
