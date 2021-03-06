import QtQuick 2.3

/****************************
 * CURRENTLY NOT IN USE !!! *
 ****************************/

Rectangle {

	width: 200
	height: 30

	radius: global_item_radius
	color: "#88000000"

	property string text: ed1.text

	property string tooltip: ""

	signal textEdited()

	TextEdit {

		id: ed1

		x: 3
		y: (parent.height-height)/2

		width: parent.width-6

		color: colour.text
//		selectedTextColor: "black"
//		selectionColor: "white"
		text: parent.text

		onTextChanged: parent.textEdited()

		ToolTip {

			text: parent.parent.tooltip

			property bool held: false

			anchors.fill: parent
			cursorShape: Qt.IBeamCursor

			// We use these to re-implement selecting text by mouse (otherwise it'll be overwritten by dragging feature)
			onDoubleClicked: parent.selectAll()
			onPressed: { held = true; ed1.cursorPosition = ed1.positionAt(mouse.x,mouse.y); parent.forceActiveFocus() }
			onReleased: held = false
			onPositionChanged: {if(held) ed1.moveCursorSelection(ed1.positionAt(mouse.x,mouse.y)) }

		}
	}
}
