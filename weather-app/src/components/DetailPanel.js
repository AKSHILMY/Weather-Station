import { Component } from "react";
import PredictionPanel from "../components/PredictionPanel";

class DetailPanel extends Component {
  render() {
    return (
      <div className="panel">
        <ul className="details">
          <h4>Weather Details</h4>
          <li>
            <span>Cloudy</span>
            <span className="cloud">89%</span>
          </li>
          <li>
            <span>Humidity</span>
            <span className="humidity">64%</span>
          </li>
          <li>
            <span>Wind Speed</span>
            <span className="wind">8km/h</span>
          </li>
          <li>
            <span>Wind Direction</span>
            <span className="wind">90&#176;</span>
          </li>
        </ul>
        <PredictionPanel />
      </div>
    );
  }
}

export default DetailPanel;
