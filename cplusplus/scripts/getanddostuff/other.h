/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#ifndef GETANDDOSTUFFOTHER_H
#define GETANDDOSTUFFOTHER_H

#include <QObject>
#include <QMovie>
#include <QFileInfo>
#include <QSize>
#include <QUrl>
#include <QGuiApplication>
#include <QCursor>
#include <QScreen>
#include <QColor>
#include <QDir>
#include <QTextStream>
#include <QStandardPaths>
#include "../../logger.h"

#ifdef GM
#include <GraphicsMagick/Magick++.h>
#include "../gmimagemagick.h"
#endif

class GetAndDoStuffOther : public QObject {

	Q_OBJECT

public:
	explicit GetAndDoStuffOther(QObject *parent = 0);
	~GetAndDoStuffOther();

	QPoint getGlobalCursorPos();
	QColor addAlphaToColor(QString col, int alpha);
	bool amIOnLinux();
	bool amIOnWindows();
	QString trim(QString s) { return s.trimmed(); }
	int getCurrentScreen(int x, int y);
	QString getTempDir();
	QString getHomeDir();
	QString getDesktopDir();
	QString getRootDir();
	QString getPicturesDir();
	QString getDownloadsDir();
	bool isExivSupportEnabled();
	bool isGraphicsMagickSupportEnabled();
	bool isLibRawSupportEnabled();
	QString getVersionString();
	QList<QString> getScreenNames();

};

#endif // GETANDDOSTUFFOTHER_H
