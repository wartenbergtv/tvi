require "rails_helper"

RSpec.describe "episodes", type: :request do
  describe "GET /episodes.rss" do
    let!(:setting) { FactoryBot.create(:setting) }

    it "generates a feed" do
      episode1 = FactoryBot.create :episode, number: 1, title: "Soli Wartenberg"
      episode2 = FactoryBot.create :episode, number: 2, title: "Anton Müller",
                                             nodes: " *some notes about the show* \n [link](https://test.com)"

      get "/episodes.rss"

      expected_xml = %(<?xml version="1.0" encoding="UTF-8"?>
        <rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/"
                           xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
                           xmlns:admin="http://webns.net/mvcb/"
                           xmlns:atom="http://www.w3.org/2005/Atom/"
                           xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                           xmlns:content="http://purl.org/rss/1.0/modules/content/"
                          xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">
          <channel>
            <title>Wartenberger Podcast</title>
            <description>Der Podcast über und um den Markt Wartenberg</description>
            <itunes:image href="#{setting.logo_url}"/>
            <language>de-de</language>
            <itunes:category text="News">
              <itunes:category text="Politics"/>
            </itunes:category>
            <itunes:explicit>false</itunes:explicit>
            <itunes:author>Michael Deimel, Thomas Rademacher</itunes:author>
            <link>http://wartenberger.test.com</link>
            <itunes:owner>
              <itunes:name>Michael Deimel</itunes:name>
              <itunes:email>admin@wartenberger.de</itunes:email>
            </itunes:owner>
            <itunes:title>Wartenberger Podcast</itunes:title>
            <copyright>Copyright #{Time.current.year} Michael Deimel</copyright>
            <item>
              <title>Anton Müller</title>
              <enclosure url="http://wartenberger.test.com/episodes/002-anton-muller.mp3" length="123" type="audio/mpeg"/>
              <guid>http://wartenberger.test.com/episodes/002-anton-muller.mp3</guid>
              <pubDate>#{episode2.published_on.to_date.rfc822}</pubDate>
              <description>
                <![CDATA[<p>we talk about bikes and things</p> <h2>Show Notes</h2> <p><em>some notes about the show</em>
                  <a href="https://test.com">link</a></p> ]]>
              </description>
              <content:encoded>
                <![CDATA[<p>we talk about bikes and things</p> <h2>Show Notes</h2> <p><em>some notes about the show</em>
                  <a href="https://test.com">link</a></p> ]]>
              </content:encoded>
              <itunes:duration>321</itunes:duration>
              <link>http://wartenberger.test.com/episodes/002-anton-muller</link>
              <itunes:image href="https://wartenberger-podcast.s3.eu-central-1.amazonaws.com/002-anton-muller.jpg"/>
              <itunes:explicit>false</itunes:explicit>
            </item>
            <item>
              <title>Soli Wartenberg</title>
              <enclosure url="http://wartenberger.test.com/episodes/001-soli-wartenberg.mp3" length="123" type="audio/mpeg"/>
              <guid>http://wartenberger.test.com/episodes/001-soli-wartenberg.mp3</guid>
              <pubDate>#{episode1.published_on.to_date.rfc822}</pubDate>
              <description>
                <![CDATA[<p>we talk about bikes and things</p> ]]>
              </description>
              <content:encoded>
                <![CDATA[<p>we talk about bikes and things</p> ]]>
              </content:encoded>
              <itunes:duration>321</itunes:duration>
              <link>http://wartenberger.test.com/episodes/001-soli-wartenberg</link>
              <itunes:image href="https://wartenberger-podcast.s3.eu-central-1.amazonaws.com/001-soli-wartenberg.jpg"/>
              <itunes:explicit>false</itunes:explicit>
            </item>
          </channel>
        </rss>)

      # Debugging
      # File.write("response.xml", response.body.squish)
      # File.write("expected_xml.xml", expected_xml.squish)
      expect(response.body.squish).to eq(expected_xml.squish)
    end
  end

  describe "GET /episode.mp3" do
    it "increment the download counter" do
      episode = EpisodePresenter.new FactoryBot.create :episode, downloads_count: 0, number: 4, title: :test

      get episode.mp3_url

      expect(response.body).to eq "<html><body>You are being " \
      "<a href=\"https://wartenberger-podcast.s3.eu-central-1.amazonaws.com/004-test.mp3\">redirected</a>.</body></html>"
      expect(episode.reload.downloads_count).to eq 1
    end
  end
end
