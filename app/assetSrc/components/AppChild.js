import React, { Component } from 'react'

export class AppChild  extends Component{

    getComponentStyle() {
      return {
        backgroundColor: '#304FFE',
        padding: '12px',
        borderRadius: '8px'
      }
    }

    render() {
        return(
        <div style={this.getComponentStyle()}>
            {this.props.sample_props}
        </div>
        )
    }

}
