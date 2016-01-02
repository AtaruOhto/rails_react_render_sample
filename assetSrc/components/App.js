import React , { Component } from 'react'
import { render } from 'react-dom'
import { AppChild } from './AppChild'

export class App extends Component {

    getComponentStyle() {
        return {
            backgroundColor: "#009688",
            color: '#F8F8F8',
            padding:  "24px",
            textAlign: 'center',
            borderRadius: '8px'
        }
    }

    render() {
        return (
            <div style={this.getComponentStyle()}>
                <h1>Hi. I'm a component created by server-side rendering.</h1>
                <AppChild sample_props={this.props.sample_props} />
            </div>
        )
    }

}
