import React from 'react';

class Spotlight extends React.Component {
  renderList = () => {
    // For edit button. If logged in, should drop the user on the page // in edit mode
    const s = this.props.dashboardData;
    let tRow = s.map((spotlight, index) => 
      <tr key={`unit-${index}`} data-item-number={index}>
        <td>
          <div className="row">
            <div className="columns medium-1">
            <a target="_blank" title="Edit Story" href={`/commonspot/dashboard/index.html#mode=author&url=${spotlight.url.substring(19)}`}><div><span style={{margin: "0 auto"}} className="fas fa-edit" >&nbsp;</span></div></a>
            </div>
            <div className="columns medium-11">
              <p><strong>{spotlight.name}</strong></p>
              <p>{spotlight.teaser}</p>
            </div>
          </div>
          <div className="row">
            <div className="columns medium-1"></div>
            <div className="columns medium-5">
              <p>{`Class Year: ${spotlight.classYear}`}</p> 
              <p>{`${spotlight.city}, ${spotlight.state} ${spotlight.country}`}</p>
            </div>
            <div className="columns medium-6">
              <p>{`YouTube: ${spotlight.youtubeVideo}`}</p>
              <p>{`Level: ${spotlight.level}`}</p>
            </div>
          </div> 
          <hr />
        </td>  
      </tr>
    );
    return tRow;
  }

  render() {
    console.log(this.props);
    
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

export default Spotlight;