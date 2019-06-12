import React from 'react';
import Units from './units';
import News from './news';

class App extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      view: null,
      dashboardData: []
    };
  }


  componentDidUpdate() {
    window.onload = () => { 
      $(document).foundation();
    }
  }

  handleViewChange = (e, newView) => {
    e.preventDefault();
    fetch(`https://site8.auth.dev.shu.commonspotcloud.com/_cs_apps/data/${newView}.json`)
    .then(response => response.json())
    .then(json => {
      this.setState({
        view: newView,
        dashboardData: json.data
      });
    })
  }

  render() {
    let renderCategory;
    
    switch(this.state.view) {
      case 'units': renderCategory = <Units dashboardData={this.state.dashboardData} mode={this.state.view} />; 
        break;
      case 'news': renderCategory = <News dashboardData={this.state.dashboardData} mode={this.state.view} />; 
        break;
      default: renderCategory = <p>Please choose a category.</p>; break;
    }
    return(
      <div>
        <section className="grid-x">
          <div className="cell medium-2">
            <button className="button" onClick={(e) => this.handleViewChange(e, "units")}>Units</button>
          </div>
          <div className="cell medium-2">
            <button className="button" onClick={(e) => this.handleViewChange(e, "news")}>News</button>
          </div>
        </section>
        <section>
          {renderCategory}
        </section> 
      </div>
    )
  }
}

export default App;
