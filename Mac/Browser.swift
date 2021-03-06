//
//  Browser.swift
//  Evergren
//
//  Created by Brent Simmons on 2/23/16.
//  Copyright © 2016 Ranchero Software, LLC. All rights reserved.
//

import Foundation
import RSWeb

struct Browser {

	static func open(_ urlString: String, invertPreference invert: Bool = false) {
		// Opens according to prefs.
		open(urlString, inBackground: invert ? !AppDefaults.openInBrowserInBackground : AppDefaults.openInBrowserInBackground)
	}

	static func open(_ urlString: String, inBackground: Bool) {
		if let url = URL(string: urlString) {
			MacWebBrowser.openURL(url, inBackground: inBackground)
		}
	}
}

extension Browser {

	static var titleForOpenInBrowserInverted: String {
		let openInBackgroundPref = AppDefaults.openInBrowserInBackground

		return openInBackgroundPref ?
			NSLocalizedString("Open in Browser in Foreground", comment: "Open in Browser in Foreground menu item title") :
			NSLocalizedString("Open in Browser in Background", comment: "Open in Browser in Background menu item title")
	}
}
