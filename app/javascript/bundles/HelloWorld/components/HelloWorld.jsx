import PropTypes from 'prop-types';
import React, { useState } from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom'

const HelloWorld = (props) => {
  const [name, setName] = useState(props.name);

  return (
    <>
    <BrowserRouter>
      <h1>react controller</h1>
      <Switch>
        <Route path="/about">
          <h1>about</h1>
        </Route>
      </Switch>
    </BrowserRouter>
    
    
    </>
  );
};

HelloWorld.propTypes = {
  name: PropTypes.string.isRequired, // this is passed from the Rails view
};

export default HelloWorld;
