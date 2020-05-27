pragma Singleton

import QtQuick 2.10

QtObject {
    signal recentPoemsRefreshed()
    signal topPoetsRefreshed()
    signal favoritesRefreshed()

    signal snackbarRequest(string text)
}