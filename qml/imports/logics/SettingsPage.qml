import QtQuick 2.12
import AsemanQml.Base 2.0
import AsemanQml.Viewport 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.IOSStyle 2.0
import globals 1.0
import views 1.0
import models 1.0

SettingsView {
    id: dis
    menuBtn.onClicked: ViewportType.open = false

    Timer {
        id: initTimer
        running: true
        interval: 1000
        repeat: false
    }

    languageCombo.onCurrentIndexChanged: if (!initTimer.running) AsemanGlobals.language = languageCombo.model.get(languageCombo.currentIndex).key
    themeCombo.onCurrentIndexChanged: {
        if (initTimer.running)
            return;

        if (Devices.isAndroid) {
            switch (themeCombo.currentIndex) {
            case 0:
                AsemanGlobals.androidTheme = Material.Light;
                break;
            case 1:
                AsemanGlobals.androidTheme = Material.Dark;
                break;
            }
        } else {
            switch (themeCombo.currentIndex) {
            case 0:
                AsemanGlobals.iosTheme = IOSStyle.System;
                break;
            case 1:
                AsemanGlobals.iosTheme = IOSStyle.Light;
                break;
            case 2:
                AsemanGlobals.iosTheme = IOSStyle.Dark;
                break;
            }
        }
    }

    Component.onCompleted: {
        for (var i=0; i<languageCombo.model.count; i++) {
            if (languageCombo.model.get(i).key == AsemanGlobals.language) {
                languageCombo.currentIndex = i;
                break;
            }
        }

        if (Devices.isAndroid) {
            switch (AsemanGlobals.androidTheme) {
            case Material.Light:
                themeCombo.currentIndex = 0;
                break;
            case Material.Dark:
                themeCombo.currentIndex = 1;
                break;
            }
        } else {
            switch (AsemanGlobals.iosTheme) {
            case IOSStyle.System:
                themeCombo.currentIndex = 0;
                break;
            case IOSStyle.Light:
                themeCombo.currentIndex = 1;
                break;
            case IOSStyle.Dark:
                themeCombo.currentIndex = 2;
                break;
            }
        }
    }
}
