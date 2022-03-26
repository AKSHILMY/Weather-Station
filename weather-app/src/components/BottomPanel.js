import React, { Component } from "react";

class BottomPanel extends React.Component {
  render() {
    return (
      <div>
        <h1 className="temp">16&#176;</h1>
        <div className="city-time">
          <h1 className="name">London</h1>
          <small>
            <span className="time">06:09 </span>
            <span className="date">Monday Sep 19</span>
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
