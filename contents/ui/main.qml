import QtQuick
import QtQuick.Layouts

import org.kde.plasma.plasmoid
import org.kde.plasma.private.battery

PlasmoidItem {
    id: betterbattery
    Plasmoid.backgroundHints: "NoBackground"

    property real charge: batteryControl.percent/ 100
    property real red: 1 - charge
    property real green: charge

    BatteryControlModel {
        id: batteryControl
        onPercentChanged: percent => betterbattery.charge = percent / 100
    }

    Rectangle {
        id: full
        height: betterbattery.height
        width: betterbattery.width * charge
        x: 0
        y: 0
        opacity: 0.3
    }

    Rectangle {
        id: emtpy
        height: betterbattery.height
        width: betterbattery.width * (1 - charge)
        x: full.width
        y: 0
        opacity: 0.1
    }
}
