import React from "react";
import { Route, Switch } from "react-router";

import Home from "./Pages/Home";
import "./App.css";
// import Availabilities from "./Pages/Availabilities";
// import Sitter from "./Pages/Sitter";
// import SignIn from "./Pages/SignIn";

const App = () => {
  console.log("app");
  return (
    <div className="App">
      <Switch>
        {/* <Route path="/availabilities" component={Availabilities} /> */}
        {/* <Route path="/sitters/:id" component={Sitter} /> */}
        {/* <Route path="/login" component={SignIn} /> */}
        <Route exact path="/" component={Home} />
      </Switch>
    </div>
  );
};

export default App;
