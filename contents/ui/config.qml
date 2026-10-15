/*
    SPDX-FileCopyrightText: 2013 Marco Martin <mart@kde.org>
    SPDX-FileCopyrightText: 2014 Kai Uwe Broulik <kde@privat.broulik.de>
    SPDX-FileCopyrightText: 2026 sylcrala <sylcrala@sylcrala.xyz>

    SPDX-License-Identifier: GPL-2.0-or-later
*/

// Modified for new settings

import QtQuick
import QtQuick.Controls
import org.kde.kquickcontrols as KQuickControls
import org.kde.kirigami as Kirigami

Kirigami.FormLayout {
    id: root
    twinFormLayouts: parentLayout

    property alias cfg_backgroundColor: bgColorButton.color
    property alias cfg_starColor: starColorButton.color
    property alias cfg_numberOfStars: numStarSlider.value 
    property alias cfg_animate: animateSwitch.checked
    property alias cfg_animateInterval: animateIntervalSlider.value
    property alias formLayout: root

   // background color
   KQuickControls.ColorButton {
        id: bgColorButton
        Kirigami.FormData.label: i18n("Background color:")
        dialogTitle: i18n("Select the color")
   }

   // star color
   KQuickControls.ColorButton {
        id: starColorButton
        Kirigami.FormData.label: i18n("Star color:")
        dialogTitle: i18n("Select the color")
   }

   // number of stars
   Slider {
        id: numStarSlider
        Kirigami.FormData.label: i18n("Number of stars: %1", numStarSlider.value)
        from: 0
        value: 50
        to: 1500
        stepSize: 10
   }

   // animation toggle
   Switch {
        id: animateSwitch
        Kirigami.FormData.label: i18n("Should the starfield be animated?")
   }
   // animation interval
   Slider {
        id: animateIntervalSlider
        Kirigami.FormData.label: i18n("Animation delay (ms): %1", animateIntervalSlider.value)
        from: 0
        value: 1000
        to: 1500
        stepSize: 100
   }
}
