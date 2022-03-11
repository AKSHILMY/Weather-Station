import "./App.css";
import "./index.css";
import BottomPanel from "./components/BottomPanel";
import DetailPanel from "./components/DetailPanel";
import Logo from "./components/Logo";

function App() {
  return (
    <div className="weather-app">
      <div className="container">
        <h3 className="brand"> The Weather</h3>
        <Logo />
        <BottomPanel />
      </div>
      <DetailPanel />
    </div>
  );
}

export default App;
