import React from 'react'
import { App } from './components/App'
import { renderToString } from 'react-dom/server'

let componentsMap = new Map();
componentsMap.set('App', App);

GLOBAL.renderComponent = (componentName, props) => {
    let reactElem = componentsMap.get(componentName);
    return renderToString(
        React.createElement(reactElem, props)
    );
};
