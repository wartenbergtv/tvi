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
$(document).on('turbolinks:load', function(){
  podlovePlayer(
    ".podloveplayer", {
      "version": 5,
      "show": {
        "title": "Forschergeist",
        "subtitle": "Horizonte für Bildung und Forschung",
        "summary": "Moderator Tim Pritlove spricht mit Wissenschaftlern und anderen Aktiven des Wissenschaftssystems über aktuelle und zukünftige Trends und Praktiken für die Bildung, der Forschung und der Organisation und Kommunikation der Wissenschaft.\r\n\r\nDie ausführlichen Interviews wenden sich vor allem an junge und angehende Wissenschaftler, die nach Möglichkeiten suchen, ihre Forschung und Lehre den neuen Bedürfnissen der Zeit anzupassen und weiter zu entwickeln.\r\n\r\nForschergeist ist ein Projekt des Stifterverbands für die Deutsche Wissenschaft und erscheint im Schnitt alle drei Wochen neu.",
        "poster": "/assets/forschergeist_500x500.jpg",
        "link": "https://forschergeist.de"
      },
      "title": "FG072 Verantwortung in der Informatik",
      "subtitle": "Ein Einführungskurs für Informatiker vermittelt unterschiedliche Denkweisen die gesellschaftliche Bedeutung des Fachs zu vermitteln",
      "summary": "Informatik- ein Fach nur für Nerds? Keinesfalls, denn der Code, den Programmierer schreiben, existiert ja nicht im luftleeren Raum. Software bezieht sich letzten Endes immer auf den Menschen, interagiert mit ihm, beeinflusst das soziale Leben. Und mittlerweile ist auch an technisch geprägten Fakultäten angekommen, dass Informatik eine hohe gesellschaftliche Relevanz besitzt.\r\n\r\nPeter Purgathofer lehrt an der TU Wien am Institut für Visual Computing. Der 56-Jährige tritt dafür ein, dass Software-Entwickler sich der Verantwortung bewusst sind, die ihre Arbeit hat. Denn Informatik wird zunehmend zur zentralen Disziplin schlechthin, ja sogar zum Betriebssystem unserer Gesellschaft. Tracking und Werbenetzwerke fördern eine Mediennutzung, bei der aufmerksamkeitsheischendes Clickbate mehr zählt als inhaltliche Tiefe und Seriosität. Automatisierte Entscheidungen können katastrophale Folgen haben, wie etwa bei tödlichen Unfällen autonom fahrender Autos oder den Abstürzen der Boeing 737 Max. Algorithmen sind eben keine Lösung für alles, denn wie zuverlässig sind eigentlich die Datengrundlagen, auf denen sie aufsetzen?\r\n\r\nPurgathofer hat deshalb an seiner Hochschule einen Einführungskurs für Studienanfänger entwickelt. Dabei geht es darum, der nächsten Informatikergeneration fundamentales Metawissen zu vermitteln und sie damit zu befähigen, mit einem tieferen Verständnis durch ihr Studium zu navigieren: Wie sieht die Wissenschaft auf die Welt, mit welchen Denkweisen wird Wissen geschaffen? Was sind die Konsequenzen und wo liegen die Grenzen? Es wird klar: Das Leben lässt sich nicht nur mit Einsen und Nullen erklären, es entzieht sich immer wieder der Berechenbarkeit. Informatik ist eng mit Sozialwissenschaften, Philosophie und Psychologie verwoben – und Problemlösung eben nicht nur eine technische Frage. Purgathofer kritisiert nebenbei auch die mangelnde Offenheit der vor allem unternehmensgetriebenen Forschung im Bereich Künstlicher Intelligenz. Diese Closed Science hat für die Wissenschaft als Ganzes schädliche Effekte, die verblüffend an die Zeit der Alchimisten erinnern.",
      "publicationDate": "2019-10-01T11:00:44+01:00",
      "poster": "/assets/fg072-verantwortung-in-der-informatik_500x500.jpg",
      "duration": "01:53:23.298",
      "link": "https://forschergeist.de/podcast/fg072-verantwortung-in-der-informatik/",
      "audio": [{
          "url": "https://forschergeist.de/podlove/file/2017/s/webplayer/c/episode/fg072-verantwortung-in-der-informatik.m4a",
          "size": "71862603",
          "title": "MPEG-4 AAC Audio (m4a)",
          "mimeType": "audio/mp4"
        },
        {
          "url": "https://forschergeist.de/podlove/file/2018/s/webplayer/c/episode/fg072-verantwortung-in-der-informatik.opus",
          "size": "64346759",
          "title": "Opus Audio (opus)",
          "mimeType": "audio/opus"
        },
        {
          "url": "https://forschergeist.de/podlove/file/2015/s/webplayer/c/episode/fg072-verantwortung-in-der-informatik.oga",
          "size": "97786195",
          "title": "Ogg Vorbis Audio (oga)",
          "mimeType": "audio/ogg"
        },
        {
          "url": "https://forschergeist.de/podlove/file/2014/s/webplayer/c/episode/fg072-verantwortung-in-der-informatik.mp3",
          "size": "95522160",
          "title": "MP3 Audio (mp3)",
          "mimeType": "audio/mpeg"
        }
      ],
      "files": [{
          "url": "https://forschergeist.de/podlove/file/2017/s/webplayer/c/episode/fg072-verantwortung-in-der-informatik.m4a",
          "size": "71862603",
          "title": "Episode",
          "mimeType": "audio/mp4"
        },
        {
          "url": "https://forschergeist.de/podlove/file/2021/s/website/c/page-footer/fg072-verantwortung-in-der-informatik.pdf",
          "size": "284672",
          "title": "Prospekt",
          "mimeType": "application/pdf"
        },
        {
          "url": "https://forschergeist.de/podlove/file/2048/s/website/c/page-footer/fg072-verantwortung-in-der-informatik.txt",
          "size": "132090",
          "title": "Transkripte",
          "mimeType": "text/plain"
        }
      ],
      "chapters": "",
      "contributors": [{
          "id": "1",
          "name": "Tim Pritlove",
          "avatar": "/assets/tim-pritlove_150x150.jpg",
          "group": {
            "id": "1",
            "slug": "onair",
            "title": "On Air"
          }
        },
        {
          "id": "77",
          "name": "Peter Purgathofer",
          "avatar": "/assets/peter-purgathofer_150x150.jpg",
          "group": {
            "id": "1",
            "slug": "onair",
            "title": "On Air"
          }
        }
      ],
    },

    {
      "base": "/player/",
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
        "feed": "https://forschergeist.de/feed/m4a/",
        "clients": [{
            "id": "apple-podcasts",
            "service": "id934797989"
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
            "service": "https://forschergeist.de/feed/m4a/"
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
            "service": "https://forschergeist.de/feed/m4a/"
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
