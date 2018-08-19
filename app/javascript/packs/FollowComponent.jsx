import React from 'react'
import ReactDOM from 'react-dom'
import Axios from 'axios'

class FollowComponent extends React.Component {
    constructor(props) {
        super(props);
        this.state = {isFollowing: props.isFollowing,
            numberFollowing: props.numberFollowing,
            investId: props.investId};

        console.log(this.state);

        this.followClicked = this.followClicked.bind(this);
    }

    followClicked() {
        // TODO: move this config somewhere else
        const tokenDom = document.querySelector("meta[name=csrf-token]");
        if (tokenDom) {
            console.log(tokenDom);
            const csrfToken = tokenDom.content;
            Axios.defaults.headers.common["X-CSRF-Token"] = csrfToken;
        }
        Axios.defaults.headers.common["Content-Type"] = "application/json";

        Axios.post("/invests/" + this.state.investId + "/follows")
            .then((response) => {
                console.log(response);
                this.setState({
                    isFollowing: response.data["is_following"],
                    numberFollowing: response.data["number_following"]
                });
                console.log(this.state);
            })
            .catch((error) =>{
                console.log(error);
            });
    }

    render() {
        return (
            <button onClick={this.followClicked} className="waves-effect waves-light btn btn-small btn-dark number-button-large">
                <i className="material-icons likes-icon">remove_red_eye</i>&nbsp;&nbsp;
                {this.state.isFollowing ? 'unfollow' : 'follow' }<span>{ this.state.numberFollowing }</span>
            </button>
        );
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const dataTag = document.getElementById('followContainer');
    const isFollowing = JSON.parse(dataTag.getAttribute("data-isfollowing"));
    const numberFollowing = JSON.parse(dataTag.getAttribute("data-numfollowing"));
    const investId = JSON.parse(dataTag.getAttribute("data-investid"));

    ReactDOM.render(
        <FollowComponent investId={investId} numberFollowing={numberFollowing} isFollowing={isFollowing} />,
        document.getElementById('followContainer').appendChild(document.createElement('span')),
    );
});
