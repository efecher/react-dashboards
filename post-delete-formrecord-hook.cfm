<cfscript>
	/*
	* Name: /post-delete-formrecord-hook.cfm
	* Purpose / Summary: Enables custom messaging and notification on form submission..
	* Copyright 2017, Seton Hall University. All Rights Reserved.
	*/

	//setting showdebugoutput = false; // Disable debugging on this template.
	//setting enablecfoutputonly = true;
	setting requesttimeout = 30;
	// param name='url.debug' default=0 type='boolean';
	// param name='url.clear' default=0 type='boolean';
	param name='errorExpected' default=true type='boolean';
	param name='elementName' default='Generic Custom Element' type='string';
	param name='eventType' default='Generic Post Form Hook Call';
	param name='eventDetail' default='Executed Post Form Hook Call';

	try {
		// TODO 20180824: Add a check to make sure images are in the correct color space. This may need to go in the `pre-save-form-hook.cfm` file.

		// NOTE: Check to see if we're saving element data.
		
		// NOTE: Set variable for data being added / updated and add it to the log entry.
		// data = attributes.inputStruct;
		// structAppend(logEntry, {dataValues:data});
		eventType = 'Generate JSON file.';
		eventDetail = 'Generating JSON data for ';

		// NOTE: Set variable for element id's
		AcademicAwardsEID = application.ADF.CEData.getFormIDByCEName('Academic Awards');
		BuildingsEID = application.ADF.CEData.getFormIDByCEName('Buildings');
		ByTheNumbersEID = application.ADF.CEData.getFormIDByCEName('By the Numbers');
		CategoryEID = application.ADF.CEData.getFormIDByCEName('Category');
		ChartsEID = application.ADF.CEData.getFormIDByCEName('Zurb Chart');
		EmergencyMessageEID = application.ADF.CEData.getFormIDByCEName('Emergency Messaging');
		KeyMessageEID = application.ADF.CEData.getFormIDByCEName('Key Message');
		MediaHitEID = application.ADF.CEData.getFormIDByCEName('MediaHit');
		NewsEID = application.ADF.CEData.getFormIDByCEName('News');
		PolicyEID = application.ADF.CEData.getFormIDByCEName('Policy');
		ProfileEID = application.ADF.CEData.getFormIDByCEName('Profile');
		ProgramEID = application.ADF.CEData.getFormIDByCEName('Program');
		SpotlightEID = application.ADF.CEData.getFormIDByCEName('Spotlight');
		TagsEID = application.ADF.CEData.getFormIDByCEName('Tags');
		TaskServiceEID = application.ADF.CEData.getFormIDByCEName('Tasks & Services');
		TestimonialEID = application.ADF.CEData.getFormIDByCEName('Testimonial');
		UnitsEID = application.ADF.CEData.getFormIDByCEName('Units');
		VideosEID = application.ADF.CEData.getFormIDByCEName('Videos');

		
		// NOTE: Generate JSON data for all Academic Awards
		if ( attributes.formId eq AcademicAwardsEID ) {
			include '/_cs_apps/data/academic-awards.cfm';
			elementName = 'Academic Awards';
			eventDetail = eventDetail & 'Academic Awards.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail);
		}

		// NOTE: Generate JSON data for all Buildings
		if ( attributes.formId eq BuildingsEID ) {
			include '/_cs_apps/data/buildings.cfm';
			elementName = 'Buildings';
			eventDetail = eventDetail & 'Buildings.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail);
		}

		// NOTE: Generate JSON data for all By the Numbers
		if ( attributes.formId eq ByTheNumbersEID ) {
			include '/_cs_apps/data/by-the-numbers.cfm';
			elementName = 'By the Numbers';
			eventDetail = eventDetail & 'By the Numbers.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail & 'By the Numbers.');
		}

		// NOTE: Generate JSON data for all Categories
		if ( attributes.formId eq CategoryEID ) {
			include '/_cs_apps/data/categories.cfm';
			elementName = 'Category';
			eventDetail = eventDetail & 'Category.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail & 'Categories.');
		}

		// NOTE: Generate JSON data for all Charts
		if ( attributes.formId eq ChartsEID ) {
			include '/_cs_apps/data/charts.cfm';
			elementName = 'Charts';
			eventDetail = eventDetail & 'Charts.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail & 'Charts.');
		}

		// NOTE: Generate JSON data for all Emergency Messages
		if ( attributes.formId eq EmergencyMessageEID ) {
			include '/_cs_apps/data/emergency-messages.cfm';
			elementName = 'Emergency Message';
			eventDetail = eventDetail & 'Emergency Message.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail & 'Emergency Messages.');
		}

		// NOTE: Generate JSON data for Key Messages
		if ( attributes.formId eq KeyMessageEID ) {
			include '/_cs_apps/data/key-message.cfm';
			elementName = 'Key Message';
			eventDetail = eventDetail & 'Key Message.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail & 'Key Messages.');
		}

		// NOTE: Generate JSON data for Media Hit
		if ( attributes.formId eq MediaHitEID ) {
			include '/_cs_apps/data/media-hits.cfm';
			elementName = 'Media Hit';
			eventDetail = eventDetail & 'Media Hit.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail & 'Media Hits.');
		}

		// NOTE: Generate JSON data for Media Hit
		if ( attributes.formId eq NewsEID ) {
			// include '/_cs_apps/data/news.cfm';
			elementName = 'News';
			eventDetail = eventDetail & 'News.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail & 'News.');
		}

		// NOTE: Generate JSON data for Policies
		if ( attributes.formId eq PolicyEID ) {
			include '/_cs_apps/data/policy.cfm';
			elementName = 'Policy';
			eventDetail = eventDetail & 'Policy.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail & 'Policies.');
		}

		// NOTE: Generate JSON data for Profiles
		if ( attributes.formId eq ProfileEID ) {
			include '/_cs_apps/data/profiles.cfm';
			elementName = 'Profile';
			eventDetail = eventDetail & 'Profile.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail & 'Profiles.');
		}

		// NOTE: Generate JSON data for Programs
		if ( attributes.formId eq ProgramEID ) {
			include '/_cs_apps/data/programs.cfm';
			elementName = 'Programs';
			eventDetail = eventDetail & 'Programs.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail & 'Programs.');
		}

		// NOTE: Generate JSON data for Spotlight
		if ( attributes.formId eq SpotlightEID ) {
			include '/_cs_apps/data/spotlight.cfm';
			elementName = 'Spotlight';
			eventDetail = eventDetail & 'Spotlight.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail & 'Spotlight.');
		}

		// NOTE: Generate JSON data for Tags
		if ( attributes.formId eq TagsEID ) {
			include '/_cs_apps/data/tags.cfm';
			elementName = 'Tags';
			eventDetail = eventDetail & 'Tags.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail & 'Tags.');
		}

		// NOTE: Generate JSON data for Tasks & Services...
		if ( attributes.formId eq TaskServiceEID ) {
			include '/_cs_apps/data/tasks-services.cfm';
			elementName = 'Tasks and Services';
			eventDetail = eventDetail & 'Tasks and Services.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail & 'Tasks & Services.');
		}

		// NOTE: Generate JSON data for Testimonials...
		if ( attributes.formId eq TestimonialEID ) {
			include '/_cs_apps/data/testimonials.cfm';
			elementName = 'Testimonial';
			eventDetail = eventDetail & 'Testimonial.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail & 'Testimonials.');
		}

		// NOTE: Generate JSON data for Units...
		if ( attributes.formId eq UnitsEID ) {
			include '/_cs_apps/data/units.cfm';
			elementName = 'Units';
			eventDetail = eventDetail & 'Units.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail & 'Units.');
		}

		// NOTE: Generate JSON data for Videos
		if ( attributes.formId eq VideosEID ) {
			include '/_cs_apps/data/videos.cfm';
			elementName = 'Videos';
			eventDetail = eventDetail & 'Videos.';
			// throw(type='PostSaveFormHook', errorCode='notice-0002', message=eventType, detail=eventDetail & 'Videos.');
		}

		// NOTE: Add message to the log entry
		if ( attributes.formId eq 0 ) {
			eventDetail = eventDetail & 'controlTypeID ' & attributes.formId & ' was saved. We didn''t do anything with it.';
			// throw(type='PostSaveFormHook', errorCode='notice-0001', message='Saving Generic Data.', detail='Data for controlTypeID ' & attributes.formId & ' was saved. We didn''t do anything with it.');
		}
	}

	catch (any error) {
        switch(error.type) {
            case 'PostDeleteFormRecordHook':
				// errorExpected = true;
                break;

            default:
				errorExpected = false;
				rethrow; // Throw any other error to the standard handler.
                break;
        }

		// NOTE: Send error to New Relic
		params = createObject('java', 'java.util.HashMap');
		params.put('Error Code', error.errorCode);
		params.put('Error Detail', error.detail);
		params.put('Error Message', error.message);
		params.put('Error Type', error.type);
		application.newRelic.noticeError(error, params, errorExpected);

		// NOTE: Dump out the "error" for testing
		// writeDump(var=error, expand=false, label='Notification');
	}

	finally {
		// NOTE: Dump attribute variables
		// writeDump(var=attributes, expand=false, label='Post Save Form Hook Attributes');

		// NOTE:  Stop ALL processing!!!
		// abort;

		// NOTE: Record custom event in NR Insights
		application.newRelic.getAgent().getInsights().recordCustomEvent(
			"PostDeleteFormRecordHook",
			{
				'elementName': elementName,
				'elementType': 'custom',
				'message': eventType,
				'detail': eventDetail
			}
		);
	}

</cfscript>
