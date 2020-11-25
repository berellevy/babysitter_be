import React, { useState } from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom'
import App from './App';

const HelloWorld = () => {

  return (

    <BrowserRouter>
      <App/>
    </BrowserRouter>
    
    

  );
};

export default HelloWorld;
