import QtQuick 2.3
import QtQuick.Controls 1.2

import "../elements"

Rectangle {

	id: fadein_top

	anchors.fill: background
	color: colour.fadein_slidein_bg

	opacity: 0
	visible: false

	property int marginLeftRight: 50
	property int marginTopBottom: 50

	property int contentWidth: fadein_top.width-2*marginLeftRight
	property int contentHeight: fadein_top.height-2*marginTopBottom

	property bool showSeperators: true

	// These are used to insert the elements
	property string heading: ""
	property alias content: content_placeholder.children
	property alias buttons: button_placeholder.children

	property bool clipContent: true

	// Click on margin outside elements closes element
	MouseArea {
		anchors.fill: parent
		hoverEnabled: true
		acceptedButtons: Qt.LeftButton | Qt.RightButton
		onClicked: hide()
	}

	// Display heading at top
	Text {

		id: title
		x: marginLeftRight*1.5
		y: marginTopBottom
		width: fadein_top.width-2*marginLeftRight
		text: heading

		font.pointSize: 40
		color: "white"
		font.bold: true

	}

	Rectangle {
		id: sep1
		width: content_placeholder.width
		x: marginLeftRight
		anchors.top: title.bottom
		anchors.topMargin: 5
		height: 1
		visible: showSeperators
		color: colour.linecolour
	}

	// Scrollable content in the middle
	Flickable {

		id: item

		contentHeight: content_placeholder.childrenRect.height
		contentWidth: fadein_top.width-2*marginLeftRight
		clip: clipContent

		// Set size
		anchors {
			left: parent.left
			right: parent.right
			top: sep1.bottom
			bottom: sep2.top
			leftMargin: marginLeftRight
			rightMargin: marginLeftRight
			bottomMargin: 5
			topMargin: 5
		}

		// Clicks INSIDE element don't close it
		MouseArea {
			anchors.fill: parent
			acceptedButtons: Qt.LeftButton | Qt.RightButton
		}

		Column {

			// PLACEHOLDER

			id: content_placeholder
			spacing: 10

		}

	}

	// Horizontal line
	Rectangle {
		id: sep2
		x: marginLeftRight
		anchors.bottom: button_placeholder.top
		anchors.bottomMargin: 10
		width: content_placeholder.width
		height: 1
		visible: showSeperators
		color: colour.linecolour
	}

	Rectangle {

		// PLACEHOLDER

		id: button_placeholder

		x: marginLeftRight
		width: content_placeholder.width
		height: childrenRect.height+10
		anchors.bottom: parent.bottom
		anchors.bottomMargin: marginTopBottom

		color: "#00000000"

	}

	function show() {
		showAni.start()
	}
	function hide() {
		hideAni.start()
	}

	PropertyAnimation {
		id: hideAni
		target:  fadein_top
		property: "opacity"
		to: 0
		duration: settings.myWidgetAnimated ? 250 : 0
		onStarted: unblurAllBackgroundElements()
		onStopped: {
			visible = false
			blocked = false
			if(thumbnailBar.currentFile == "")
			openFile()
		}
	}

	PropertyAnimation {
		id: showAni
		target:  fadein_top
		property: "opacity"
		to: 1
		duration: settings.myWidgetAnimated ? 250 : 0
		onStarted: {
			blurAllBackgroundElements()
			visible = true
			blocked = true
		}
	}

}

