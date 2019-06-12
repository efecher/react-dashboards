import React from 'react';
//import './App.css';

class App extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      spotlights: []
    };
  }


  componentDidMount() {

    // NOTE: use this functionality if we are remotely fetching the data from 
    // a .cfm script output, or .json file
    /*fetch("https://site8.auth.dev.shu.commonspotcloud.com/_cs_apps/react-test/spotlight-resolve-data.cfm")
    .then(response => response.json())
    .then(json => this.setState({spotlights: json}))
    .then(window.onload = (event) => {
      $(document).foundation();
    })
    .catch(e => console.error(e));*/
  
    // NOTE: use this functionality if the data is put in an object on the page already
    if(typeof spotlightData !== 'undefined') {
      this.setState({spotlights: spotlightData}, () => {window.onload = (event) => {
        $(document).foundation();
      }});
    }
  }

  renderMajorsMinors = (m,mp) => {
    let mList = [];
    if((m.length !== 0) && (mp.length !== 0)) {
      for(let i in m) {
        mList.push(<p><a href={mp[i]} target="_blank">{m[i]}</a></p>);
      }
    }

    return mList;
  }

  renderList = () => {
    if(this.state.spotlights.length !== 0) {
      const s = this.state.spotlights;
      let spotlightLi = s.map((spotlight, index) => 
      <li className="accordion-item" key={index} data-accordion-item>
        <a href="#" className="accordion-title"><strong>{spotlight.name}</strong></a>
        <div className="accordion-content" data-tab-content>
          <table>
            <thead>
              <tr>
                <th>Edit</th>
                <th>Class Year</th>
                <th>Major(s)</th>
                <th>Minor(s)</th>
                <th>Level</th>
                <th>City, State</th>
                <th>Detail Text</th>
                <th>Video</th>
                <th>Image</th>
                <th>URL</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><div rel={`/_cs_apps/ajaxProxy.cfm?bean=Forms&method=renderAddEditForm&formID=${spotlight.formid}&dataPageID=${spotlight.pageid}&lbAction=refreshparent&width=950&height=740&title=Edit`} className="ADFLightbox"><span style={{margin: "0 auto"}} className="fa fa-pencil" title={`Edit ${spotlight.name}`}>&nbsp;</span></div> X</td>
                <td>{spotlight.classyear}</td>
                <td>{(spotlight.majors.length !== 0) ? this.renderMajorsMinors(spotlight.majors, spotlight.majorpages) : `<p>no majors</p>`}</td>
                <td>{(spotlight.minors.length !== 0) ? this.renderMajorsMinors(spotlight.minors, spotlight.minorpages) : `<p>no minors</p>`}</td>
                <td>{spotlight.level}</td>
                <td>{spotlight.city}, {spotlight.state}</td>
                <td width="20%"><p style={{maxHeight: "100px", overflowY: "scroll"}}>{spotlight.description}</p></td>
                <td><a href={`https://www.youtube.com/watch?v=${spotlight.youtubevideo}`} target="_blank">Youtube Video</a></td>
                <td><img style={{maxHeight: "100px"}} src={spotlight.resolvedimage.imageurl} alt={spotlight.resolvedimage.imagealttext} height="100" /></td>
                <td><a href={spotlight.resolvedpageurl} target="_blank">Spotlight Detail Page</a></td>
              </tr>
            </tbody>
          </table>
        </div>
    </li>
    );
    return spotlightLi;
    } else {
      return <p>Loading...</p>
    }
  }

  render() {
    if(this.state.spotlights.length !== 0) {
      return( 
        <div>
          <ul className="accordion" data-accordion>
            {this.renderList()}
          </ul>
        </div>
      )
    } else {
      return <p>loading...</p>
    }
  }
}

export default App;
