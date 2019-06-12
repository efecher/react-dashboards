import React from 'react';

class News extends React.Component {
  

  componentDidMount() {
    window.onload = () => { 
      $(document).foundation();
    }
  }

  renderList = () => {
    // For edit button. If logged in, should drop the user on the page // in edit mode
    const s = this.props.dashboardData;
    let unitLi = s.map((story, index) => 
      <li className="accordion-item" key={`unit-${index}`} data-item-number={index} data-accordion-item>
        <a href="#" className="accordion-title"><h4>{story.headline}</h4></a>
        <div className="accordion-content" data-tab-content>
          <h5>Current Data:</h5>
          <div className="row">
            <div className="columns medium-1">
              <div><span style={{margin: "0 auto"}} className="fas fa-edit" ><a target="_blank" title="Edit Story" href={`/commonspot/dashboard/index.html#mode=author&url=${story.url.substring(19)}`}>&nbsp;</a></span></div>
            </div>
            <div className="columns medium-11">
              <p><strong>{story.description}</strong></p>
            </div>
          </div>
          <hr />
          <div className="row">
            <div className="columns medium-6">
              <p>{`Published Date: ${story.pubDate}`}</p> 
              <p>{`By: ${story.byLine}`}</p>
            </div>
            <div className="columns medium-6">
              <p>{`Contact Name: ${story.contactName}`}</p>
              <p>{`Contact Email: ${story.contactEmail}`}</p>
              <p>{`Contact Phone: ${story.contactPhone}`}</p>
            </div>
          </div>
        </div>   
      </li>
    );
    return unitLi;
  }


  render() {
    if(this.props.dashboardData.length !== 0) {
      return(
        <div>
          <h3>{this.props.mode}</h3>
          <ul className="accordion" data-accordion data-allow-all-closed="true">
            {this.renderList()}
          </ul>
        </div>
      ) 
    } else {
      return <p>Loading...</p>
    } 
  }
}

export default News;