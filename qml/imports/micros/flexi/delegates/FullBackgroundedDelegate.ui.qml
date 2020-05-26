import QtQuick 2.12
import globals 1.0
import QtQuick.Controls 2.3
import AsemanQml.Base 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.IOSStyle 2.0

AbstractDelegate {
    id: adel
    width: Constants.width
    height: 100 * Devices.density
    property alias image: image
    property alias title: title
    property alias background: background

    Rectangle {
        anchors.fill: parent
        color: Colors.primary
    }

    CachedImage {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
        sourceSize.width: adel.width * 1.2
        sourceSize.height: adel.height * 1.2
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#18f"
    }

    Label {
        id: title
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.margins: 10 * Devices.density
        font.pixelSize: 9 * Devices.fontDensity
        text: "We needs change"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        maximumLineCount: 2
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
        Material.foreground: Material.background
        IOSStyle.foreground: IOSStyle.background
    }
}
