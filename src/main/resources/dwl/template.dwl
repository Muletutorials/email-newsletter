%dw 2.0
output application/xml writeDeclaration = false
---
section: {
	h2: "Here's your news feed generated by Mule",
	(payload.articles filter ($.publishedAt > (now() - |P1D|) as String {format: "yyyy-MM-dd'T'hh:mm:ss"}) map (article, articleIndex) -> {
		div @(style: " border: 1px solid #000; padding: 5px 10px;margin: 10px;height:100px;"): {
			(img @(src: article.urlToImage, style: "height:100px; width: 100px;margin-right: 5px;float: left;"): "") if(article.urlToImage != null),
			a @(href: article.url, style: "text-decoration: none;color: #002133;"): h2: article.title,
			(p: article.description) if (article.description != null)
 	}})
}