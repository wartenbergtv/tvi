// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)
require("@rails/ujs").start()
require("turbolinks").start()
import "@podlove/web-player/embed"
import 'bootstrap/dist/js/bootstrap'
import "@fortawesome/fontawesome-free/css/all.css";

// custom css
require("css/application.scss")

import AOS from 'aos';
import("aos/dist/aos.css")

//document.addEventListener("turbolinks:load", () => {
$(document).on('turbolinks:load', function() {

  // https://docs.podlove.org/podlove-web-player/
  const player = document.querySelector('.podloveplayer');
  console.log(player.dataset);
  console.log(player.dataset.title);
  podlovePlayer(
    ".podloveplayer", {
      "version": 5,
      "show": {
      },
      "title": player.dataset.title,
      "subtitle": "",
      "summary":  player.datase.description,
      "publicationDate": player.dataset.published_on,
      "poster": player.dataset.poster,
      "duration": player.dataset.duration,
      "link": player.dataset.link,
      "audio": [

        {
          "url": player.dataset.mp3Url,
          "size": player.dataset.file_size,
          "title": "MP3 Audio (mp3)",
          "mimeType": "audio/mpeg"
        }
      ],
      "files": [
      ],
      "chapters": "",
      "contributors": [
      ],
    },

    {
      "base": "/packs/media/player/",
      "theme": {
        "tokens": {
          "brand": "#166255",
          "brandDark": "#166255",
          "brandDarkest": "#1A3A4A",
          "brandLightest": "#E5EAECFF",
          "shadeDark": "#807E7C",
          "shadeBase": "#807E7C",
          "contrast": "#000",
          "alt": "#fff"
        },
        "fonts": {
          "ci": {
            "name": "RobotoBlack",
            "family": [
              "RobotoBlack",
              "Calibri",
              "Candara",
              "Arial",
              "Helvetica",
              "sans-serif"
            ],
            "weight": 900,
            "src": ["./assets/Roboto-Black.ttf"]
          },
          "regular": {
            "name": "FiraSansLight",
            "family": [
              "FiraSansLight",
              "Calibri",
              "Candara",
              "Arial",
              "Helvetica",
              "sans-serif"
            ],
            "weight": 300,
            "src": ["./assets/FiraSans-Light.ttf"]
          },
          "bold": {
            "name": "FiraSansBold",
            "family": [
              "FiraSansBold",
              "Calibri",
              "Candara",
              "Arial",
              "Helvetica",
              "sans-serif"
            ],
            "weight": 700,
            "src": ["./assets/FiraSans-Bold.ttf"]
          }
        }
      },
      "subscribe-button": {
        "feed": "https://www.wartenberger.de/episodes.rss",
        "clients": [{
            "id": "apple-podcasts",
            "service": "id1546458413"
          },
          {
            "id": "antenna-pod"
          },
          {
            "id": "beyond-pod"
          },
          {
            "id": "castro"
          },
          {
            "id": "clementine"
          },
          {
            "id": "deezer",
            "service": "deezer-id"
          },
          {
            "id": "downcast"
          },
          {
            "id": "google-podcasts",
            "service": "https://podcasts.google.com/feed/aHR0cHM6Ly93d3cud2FydGVuYmVyZ2VyLmRlL2VwaXNvZGVzLnJzcw"
          },
          {
            "id": "gpodder"
          },
          {
            "id": "itunes"
          },
          {
            "id": "i-catcher"
          },
          {
            "id": "instacast"
          },
          {
            "id": "overcast"
          },
          {
            "id": "player-fm"
          },
          {
            "id": "pocket-casts"
          },
          {
            "id": "pocket-casts",
            "service": "https://wartenberger.de/feed/m4a/"
          },
          {
            "id": "pod-grasp"
          },
          {
            "id": "podcast-addict"
          },
          {
            "id": "podcast-republic"
          },
          {
            "id": "podcat"
          },
          {
            "id": "podscout"
          },
          {
            "id": "rss-radio"
          },
          {
            "id": "rss"
          }
        ]
      },
      "share": {
        "channels": ["facebook", "twitter", "mail", "link"],
        "outlet": "/share.html",
        "sharePlaytime": true
      }
    });

  AOS.init({
    duration: 800,
    easing: 'slide',
    once: true
  });

});
