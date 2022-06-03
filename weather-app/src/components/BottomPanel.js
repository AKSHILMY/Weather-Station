import React from "react";

class BottomPanel extends React.Component {
  render() {
    return (
      <div>
        <h1 className="temp">16&#176;</h1>
        <div className="city-time">
          <h1 className="name">Kandy</h1>
          <small>
            <span className="time">10:53 </span>
            <span className="date">Friday June 3</span>
          </small>
        </div>
        <div className="weather">
          <img
            src={require("../assets/cloudy.jpg")}
            className="icon"
            alt="icon"
            width="50"
            height="50"
          />
        </div>
        <span className="condition">Cloudy</span>
      </div>
    );
  }
}

export default BottomPanel;
