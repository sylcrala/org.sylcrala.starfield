/*
    SPDX-FileCopyrightText: 2013 Marco Martin <mart@kde.org>
    SPDX-FileCopyrightText: 2026 sylcrala <sylcrala@sylcrala.xyz>

    SPDX-License-Identifier: GPL-2.0-or-later
*/

// Modified for starfield implementation, branching off from 'org.kde.color'

import QtQuick
import org.kde.kirigami as Kirigami
import org.kde.plasma.plasmoid

// TODO: optimize rendering and memory handling as much as possible, to maximize performance. (maybe gpu-based rendering, or byte-packing the individual star data?)

WallpaperItem {
    id: root
    readonly property list<string> starOptions: ['.', '*', '✦', '✧', '◦', '∘']

    property int starCount: root.configuration.numberOfStars
    property bool isAnimated: root.configuration.animate    
    property color bgColor: root.configuration.backgroundColor
    property color starColor: root.configuration.starColor
    property int interval: root.configuration.animateInterval

    property var stars: []
    property int frame: 0

    function randInt(minVal, maxVal) {
        return Math.floor(Math.random() * (maxVal - minVal + 1)) + minVal;
    }

    function initialize() {
        // size guard
        if (root.width <= 0 || root.height <= 0) {
            return;
        }

        const list = []
        for (let i = 0; i < starCount; i++) {
            list.push({
                "x": randInt(0, root.width),
                "y": randInt(0, root.height),
                "pattern": starOptions[randInt(0, starOptions.length - 1)],
                "speed": randInt(2, 20),
                //"size": randInt(10, 30), // removed for performance
            });
        }
        root.stars = list;
        canvas.requestPaint();
    }

    Component.onCompleted: initialize()
    onStarCountChanged: initialize()
    onWidthChanged: initialize()
    onHeightChanged: initialize()
    onStarColorChanged: canvas.requestPaint()



    Rectangle {
        id: background
        anchors.fill: parent
        color: root.bgColor
    }
    // starfield canvas
    Canvas { 
        id: canvas
        anchors.fill: parent

        onPaint: {
            const ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);
            ctx.fillStyle = root.starColor;
            ctx.textBaseline = "middle";

            for (const s of root.stars) {
                // size removed for performance 
                //ctx.font = s.size + "px sans-serif";

                ctx.fillText(s.pattern, s.x, s.y);
            }
        }

        /*
        animation timer
        NOTE: when animation is turned on, CPU usage spikes immensely (~2% -> ~40%)
            - removing the individual star size functionality (specifically, commenting out the ctx.font call in the onPaint block) 
                reduces usage significatly (~5%-7%)
        */
        Timer {
            interval: root.interval
            running: root.isAnimated
            repeat: true
            onTriggered: {
                for (const s of root.stars) {
                    s.x += s.speed;
                    if (s.x > root.width) {
                        s.x = 0; // wrap around
                    }
                }
                canvas.requestPaint();
            }
        }
    }
}

