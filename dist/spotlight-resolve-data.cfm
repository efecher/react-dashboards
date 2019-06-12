<cfscript>
try {

  // NOTE: for retrieval of page data
  pageComponent = Server.CommonSpot.api.getObject('Page');

  // NOTE: original Spotlight data
  data = application.ADF.ceData.getCeData(
    customElementName="Spotlight"
  );

  writeDump(data);

  // NOTE: output array for cleaned up data
  output = arrayNew(1);
  
  for(d=1; d LTE arrayLen(data); d++) {
    // NOTE: data object for each record
    values = {};
    values['name'] = data[d].values.name;
    values['classYear'] = data[d].values.classYear;
    values['level'] = data[d].values.level;
    values['city'] = data[d].values.city;
    values['state'] = data[d].values.state;
    values['description'] = reReplaceNoCase(data[d].values.description, '<[^>]*(?:>|$)', '', 'ALL');
    values['resolvedPageURL'] = pageComponent.getInfo(data[d].pageID).URL;
    imageData = application.ADF.csData.decipherCPIMAGE(data[d].values.imageMedium);
    values['imageData']['imageURL'] = imageData.resolvedURL.serverRelative;
    values['imageData']['imageAltText'] = imageData.altText;
    values['resolvedPageURL'] = pageComponent.getInfo(data[d].pageID).URL;
    imageData = application.ADF.csData.decipherCPIMAGE(data[d].values.imageMedium);
    values['resolvedImage']['imageURL'] = imageData.resolvedURL.serverRelative;
    values['resolvedImage']['imageAltText'] = imageData.altText;
    values['youtubeVideo'] = data[d].values.youtubeVideo;

    // NOTE: resolve Majors/Minors
    if(listLen(data[d].values.majors) GT 0) {
      resolvedMajors = application.ADF.ceData.getCEData(
        customElementName="Program",
        customElementFieldName="uuid",
        item=data[d].values.majors
      );
    }

    if(listLen(data[d].values.minors) GT 0) {
      resolvedMinors = application.ADF.ceData.getCEData(
        customElementName="Program",
        customElementFieldName="uuid",
        item=data[d].values.minors
      );
    }

    values['majors'] = arrayNew(1);
    values['majorPages'] = arrayNew(1);
    values['minors'] = arrayNew(1);
    values['minorPages'] = arrayNew(1);

    for(mj in resolvedMajors) {
      programStruct = pageComponent.getInfo(mj.pageId);
      arrayAppend(values['majors'], mj.values.name);
      arrayAppend(values['majorPages'], programStruct.url);
    }

    if(isDefined("resolvedMinors")) {
      for(mi in resolvedMinors) {
        programStruct = pageComponent.getInfo(mi.pageId);
        arrayAppend(values['minors'], mi.values.name);
        arrayAppend(values['minorPages'], programStruct.url);
      }
    } else {
      // NOTE: there are no minors defined, make empty arrays
      values['minors'] = [];
      values['minorPages'] = [];
    }

    // NOTE: after the data for each record is pulled out, append to the array
    arrayAppend(output, values);
  }
 
  // NOTE: finally, serialize the data for output
  writeOutput(serializeJSON(output));
} catch (any error) {
    error.errorCode = 'error-0001';
    error.detail = 'Error converting UUID to names';
    error.message = 'Element Data Retrieval Error';
    params=createObject('java', 'java.util.HashMap');
    params.put('Error Code', error.errorCode);
    params.put('Error Detail', error.detail);
    params.put('Error Message', error.message);
    params.put('Error Type', error.type);
    application.newRelic.noticeError(error, params, false);	
    writeOutput(error);
  }
</cfscript>