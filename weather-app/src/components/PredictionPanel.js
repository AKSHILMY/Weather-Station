import { Component } from "react";

class PredictionPanel extends Component {
  render() {
    return (
      <ul className="details">
        <h4>Predictions</h4>
        <li>
          <span>Chance of Rain</span>
          <span className="cloud">59%</span>
        </li>
      </ul>
    );
  }
}

export default PredictionPanel;
