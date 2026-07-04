import java.util.prefs.Preferences;

public class SetTheme {
    public static void main(String[] args) {
        Preferences prefs = Preferences.userRoot().node("edumips64.config");
        prefs.putBoolean("DARKTHEME", Boolean.parseBoolean(args[0]));
    }
}
