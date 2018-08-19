import React from 'react'
import ReactDOM from 'react-dom'
import Axios from 'axios'

class FollowComponent extends React.Component {
    constructor(props) {
        super(props);
        this.state = {isFollowing: props.isFollowing,
            investId: props.investId};

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
                this.setState({isFollowing: response.data["is_following"]});
            })
            .catch((error) =>{
                console.log(error);
            });
    }

    render() {
        return (
            <h6 className="pl2 pointer" onClick={this.followClicked}>
                <i className="material-icons likes-icon">thumb_up</i>
                <span id="likeCount" className="like-button">{ this.state.isFollowing.toString() }</span>
            </h6>
        );
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const dataTag = document.getElementById('followContainer');
    const isFollowing = dataTag.getAttribute("data-isfollowing");
    const investId = dataTag.getAttribute("data-investid");

    ReactDOM.render(
        <FollowComponent investId={investId} isFollowing={isFollowing} />,
        document.getElementById('followContainer').appendChild(document.createElement('div')),
    );
});
