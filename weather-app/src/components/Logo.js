import { Component } from "react";
class Logo extends Component {
  render() {
    return (
      <div className="weather">
        <img
          src={require("../assets/logo.png")}
          className="icon"
          alt="icon"
          width="250"
          height="250"
        />
      </div>
    );
  }
}

export default Logo;
