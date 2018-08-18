import React from 'react'
import ReactDOM from 'react-dom'
import Axios from 'axios'

class LikeComponent extends React.Component {
    constructor(props) {
        super(props);
        this.state = {likes: props.likes,
            investId: props.investId};

        this.likeClicked = this.likeClicked.bind(this);
    }

    likeClicked() {
        // TODO: move this config somewhere else
        const tokenDom = document.querySelector("meta[name=csrf-token]");
        if (tokenDom) {
            console.log(tokenDom);
            const csrfToken = tokenDom.content;
            Axios.defaults.headers.common["X-CSRF-Token"] = csrfToken;
        }
        Axios.defaults.headers.common["Content-Type"] = "application/json";

        Axios.post("/invests/" + this.state.investId + "/likes")
            .then((response) => {
                console.log(response);
                this.setState({likes: response.data["invest_likes"]});
            })
            .catch((error) =>{
                console.log(error);
            });
    }

    render() {
        return (
            <h6 className="pl2 pointer" id="likeButton" onClick={this.likeClicked}>
                <i className="material-icons likes-icon">thumb_up</i>
                <span id="likeCount" className="like-button">{ this.state.likes }</span>
            </h6>
        );
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const dataTag = document.getElementById('likeContainer');
    const likes = dataTag.getAttribute("data-likes");
    const investId = dataTag.getAttribute("data-investid");

    ReactDOM.render(
        <LikeComponent investId={investId} likes={likes} />,
        document.getElementById('likeContainer').appendChild(document.createElement('div')),
    );
});
