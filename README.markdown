# CodaAutosaveOnDeactivate

I got tired of forgetting to save all my splits (I usually run the max number of allowed splits (4)) before previewing in Firefox or committing in git. So I wrote this plug-in. 

This plugin was fueled by jealousy of [@violasong](https://twitter.com/violasong)'s use of TextMate's **Prefs > Advanced > Saving > Save files when focus is lost** setting.

Rev-locked to Coda 1.6.4 because I take advantage of private  undocumented reverse-engineered internal Coda architecture.

Panic peeps: I wouldn't need to rely on your internal stuff if you did one or both things:

* Allow AppleScript `save someSplit` to work.

* Get your `-[NSDocument isDocumentEdited]` implementation working.

Install it in `~/Library/Application Support/Coda/Plug-ins`.