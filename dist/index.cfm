<cfscript>
  try {
    application.ADF.scripts.loadADFLightbox();
    
    this.FormID = application.ADF.CEData.getFormIDByCEName('Units');

    // NOTE: for retrieval of page data
    pageComponent = Server.CommonSpot.api.getObject('Page');

    // NOTE: original Spotlight data
    data = application.ADF.ceData.getCeData(
      customElementName="Units"
    );

    // NOTE: output array for cleaned up data
    output = arrayNew(1);
    
    //writeDump(data);

    for(d=1; d LTE arrayLen(data); d++) {
      values = data[d].values;
      values['formid'] = data[d].formID;
      values['pageid'] = data[d].pageID;
      arrayAppend(output, values);
    }

    // NOTE: output the final data as a JS variable available on the page for the React app.
    writeOutput("<script>const " & toScript(output, 'unitsData') & "</script>");
    writeOutput("<script>const " & toScript(application.ADF.ajaxProxy, 'ajaxProxy') & "</script>");


    // NOTE: render the app
    writeOutput('
    <div id="app"></div>
    <script src="/_cs_apps/react-test/bundle.js"></script>
    ');
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