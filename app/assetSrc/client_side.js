import React from 'react'
import { App } from './components/App'
import ReactDOM  from 'react-dom'

// __reactComponents.[componentName].props
// __reactComponents.[componentName].containerClass


let myApp = React.createElement(App, __reactComponents.App.props)
ReactDOM.render(myApp, document.querySelector('.' + __reactComponents.App.containerClass))
