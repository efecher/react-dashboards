import React from 'react';

class Units extends React.Component {

  componentDidMount() {
    
  }

  renderList = () => {
    const s = this.props.dashboardData;
    let tRow = s.map((unit, index) => 
      <tr key={`unit-${index}`}>
        <td>
          <div className="row">
            <div className="columns medium-1">
              <div rel={`/_cs_apps/ajaxProxy.cfm?bean=Forms&method=renderAddEditForm&formID=${unit.formID}&dataPageID=${unit.pageID}&lbAction=refreshparent&width=950&height=740&title=Edit`} className="ADFLightbox"><span style={{margin: "0 auto"}} className="fas fa-edit" title={`Edit ${unit.name}`}>&nbsp;</span></div>
            </div>
            <div className="columns medium-6">
              <p><strong>{`${(unit.prefix) ? unit.prefix: ""} ${unit.name} ${(unit.suffix)? unit.suffix:""}`}</strong></p>
            </div>
            <div className="columns medium-1">
              <div rel={`${ajaxProxy}?bean=Forms&method=renderDeleteForm&formID=${unit.formID}&dataPageID=${unit.pageID}&lbAction=refreshparent&width=950&height=740&title=Delete ${unit.name}"`}title={`Delete ${unit.name}`} className="ADFLightbox"><i style={{margin: "0 auto"}} className="fas fa-trash" title={`Delete ${unit.name}`}>&nbsp;</i></div>
            </div>
          </div>
          <div className="row">
            <div className="columns medium-6">
              <p>{unit.building}{(unit.room)? `, ${unit.room}` : ""}</p>
              {(unit.address1)?<p>{unit.address1}</p>:""} 
              <p>{unit.city}, {unit.state} {unit.zipcode}</p>
            </div>
            <div className="columns medium-6">
              <p>{unit.email}</p>
              <p>{unit.phone1}</p>
              {(unit.phone2)?<p>{unit.phone2}</p>:""}
            </div>
          </div>
          <div className="row">
            <div className="columns medium-12">
              {(unit.unithours)?<p><strong>Hours:</strong> {unit.unithours}</p>:""}
            </div>
          </div>
          <div className="row">
            <div className="columns medium-12">
              {(unit.url)?<p><strong><a href={unit.url} target="_blank">{unit.url}</a></strong></p>:""}
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

export default Units;