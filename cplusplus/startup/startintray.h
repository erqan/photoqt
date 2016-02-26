#ifndef STARTINTRAY_H
#define STARTINTRAY_H

#include <QScreen>
#include <QDir>
#include <QGuiApplication>
#include "../logger.h"

namespace StartupCheck {

	namespace StartInTray {

		static inline void makeSureSettingsReflectTrayStartupSetting(bool verbose, int startintray, QString *settingsText) {

			if(verbose) LOG << DATE << "StartupCheck::StartInTray" << std::endl;

			if(startintray) {

				if(verbose) LOG << DATE << "Starting minimised to tray" << std::endl;

				// If the option "Use Tray Icon" in the settings is not set, we set it

				if(!settingsText->contains("TrayIcon=1")) {

					if(settingsText->contains("TrayIcon=0"))
						settingsText->replace("TrayIcon=0","TrayIcon=1");

					else if(settingsText->contains("TrayIcon=2"))
						settingsText->replace("TrayIcon=2","TrayIcon=1");

					else
						*settingsText += "\n\nTrayIcon=1\n";

				}

			}

		}

	}

}

#endif // STARTINTRAY_H