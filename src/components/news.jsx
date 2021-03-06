import React from 'react';

class News extends React.Component {
  

  componentDidMount() {
    
  }

  renderList = () => {
    // For edit button. If logged in, should drop the user on the page // in edit mode
    const s = this.props.dashboardData;
    let tRow = s.map((story, index) => 
      <tr key={`unit-${index}`} data-item-number={index}>
        <td>
          <div className="row">
            <div className="columns medium-1">
            <a target="_blank" title="Edit Story" href={`/commonspot/dashboard/index.html#mode=author&url=${story.url.substring(19)}`}><div><span style={{margin: "0 auto"}} className="fas fa-edit" >&nbsp;</span></div></a>
            </div>
            <div className="columns medium-11">
              <p><strong>{story.headline}</strong></p>
              <p>{story.description}</p>
            </div>
          </div>
          <div className="row">
            <div className="columns medium-1"></div>
            <div className="columns medium-5">
              <p>{`Published Date: ${story.pubDate}`}</p> 
              <p>{`By: ${story.byLine}`}</p>
            </div>
            <div className="columns medium-6">
              <p>{`Contact Name: ${story.contactName}`}</p>
              <p>{`Contact Email: ${story.contactEmail}`}</p>
              <p>{`Contact Phone: ${story.contactPhone}`}</p>
            </div>
          </div> 
          <hr />
        </td>  
      </tr>
    );
    return tRow;
  }


  render() {
    if(this.props.dashboardData.length !== 0) {
      return(
        <div>
          <h3>{`${this.props.mode} Element Data`}</h3>
          <hr />
          <table className="striped">
            {this.renderList()}
          </table>
        </div>
      ) 
    } else {
      return <p>Loading...</p>
    } 
  }
}

export default News;