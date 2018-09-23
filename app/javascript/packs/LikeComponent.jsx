import React from "react";
import ReactDOM from "react-dom";
import Axios from "axios";

class LikeComponent extends React.Component {
    constructor(props) {
        super(props);
        this.state = {likes: props.likes,
            isLiked: props.isLiked,
            investId: props.investId};

        this.likeClicked = this.likeClicked.bind(this);
    }

    likeClicked() {
        // TODO: move this config somewhere else
        const tokenDom = document.querySelector("meta[name=csrf-token]");
        if (tokenDom) {
            const csrfToken = tokenDom.content;
            Axios.defaults.headers.common["X-CSRF-Token"] = csrfToken;
        }
        Axios.defaults.headers.common["Content-Type"] = "application/json";

        Axios.post("/invests/" + this.state.investId + "/likes")
            .then((response) => {
                this.setState({
                    likes: response.data["invest_likes"],
                    isLiked: response.data["is_liked"]
                });
            })
            .catch((error) => {
                // TODO: handle this error in some way
            });

    }

    render() {
        if (this.state.isLiked) {
            return (
                <button onClick={this.likeClicked} className="main-shadow-alt bg-near-white near-black ph2 pv1 f6 ttu p-font bw0 mr3 pointer">
                    <i className="fas fa-heart mr2 pl0 ml0"></i>
                    likes <span className="bl b--near-black tr pl2 pr0 ml1 pl1">{ this.state.likes }</span>
                </button>
            );
        } else {
            return (
                <button onClick={this.likeClicked} className="main-shadow-alt bg-near-white near-black ph2 pv1 f6 ttu p-font bw0 mr3 pointer">
                    <i className="far fa-heart mr2 pl0 ml0"></i>
                    likes <span className="bl b--near-black tr pl2 pr0 ml1 pl1">{ this.state.likes }</span>
                </button>
            );
        }
    }
}

document.addEventListener("turbolinks:load", () => {
    const dataTag = document.getElementById("likeContainer");
    if (dataTag) {
        const likes = JSON.parse(dataTag.getAttribute("data-likes"));
        const isLiked = JSON.parse(dataTag.getAttribute("data-isliked"));
        const investId = JSON.parse(dataTag.getAttribute("data-investid"));

        ReactDOM.render(
            <LikeComponent investId={investId} likes={likes} isLiked={isLiked} />,
            document.getElementById("likeContainer"),
        );
    }
});

document.addEventListener("turbolinks:before-render", () => {
    ReactDOM.unmountComponentAtNode(document.getElementById("likeContainer"));
}); 