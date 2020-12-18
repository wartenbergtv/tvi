xml.instruct!
xml.rss :version => '2.0', 'xmlns:dc' => 'http://purl.org/dc/elements/1.1/', 'xmlns:sy' => 'http://purl.org/rss/1.0/modules/syndication/', 'xmlns:admin' => "http://webns.net/mvcb/", 'xmlns:atom' => 'http://www.w3.org/2005/Atom/', 'xmlns:rdf' => 'http://www.w3.org/1999/02/22-rdf-syntax-ns#', 'xmlns:content' => 'http://purl.org/rss/1.0/modules/content/', 'xmlns:itunes' => 'http://www.itunes.com/dtds/podcast-1.0.dtd' do
  xml.channel do
    xml.title @feed.title
    xml.link href: show_episodes_url(@show)

    if @show.episodes.published.any?
      xml.pubDate @show.episodes.published.first.rss_pub_date
    end

    xml.description @feed.short_description
    xml.language 'en-us'
    xml.tag! 'itunes:new-feed-url', show_episodes_url(@show, format: :xml)
    xml.tag! 'itunes:subtitle', @feed.title
    xml.tag! 'itunes:author', 'thoughtbot'
    xml.tag! 'itunes:summary', strip_tags(@show.description)
    xml.tag! 'itunes:image', href: @fee.image_url
    xml.tag! 'itunes:keywords', @feed.keywords
    xml.tag! 'itunes:explicit', 'no'

    xml.tag! 'itunes:owner' do
      xml.tag! 'itunes:name', 'thoughtbot'
      xml.tag! 'itunes:email', @feed.email
    end

    xml.tag! 'itunes:category', text: 'Technology' do
      xml.tag! 'itunes:category', text: 'Software How-To'
    end

    xml << render(@feed.episodes)
  end
end
