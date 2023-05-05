# README

The News Api is a simple API that interacts with https://gnews.io.

The available functionality allows to get the topline news, searching using keywords as a query param and the possibility to search into
the title, the description, the content; any or all of them.

In order to run the application, please follow the next steps

- Please make sure to have the proper environment for ruby '2.7.1' and Rails 6.1.7.3
- Run `bundle install` in order to setup the gems and dependencies
- Run `rails db:create` in order to create the database, this api is using sqlite in the meantime, PostgreSQL or MySQL might be better options for the v2, and if we plan to store any data.
- Run `rails s`
- Internally the application has my token, it allows 100 requests daily, feel free to change it and use another one for testing purposes

The following endpoints are available

- Get Articles
http://127.0.0.1:3000/articles?token=[TOKEN]

- Show an Article
http://127.0.0.1:3000/articles/[ANY_ARTICLE_ID]?token=[TOKEN]

- Search into Articles (One possible sample)
http://127.0.0.1:3000/articles/search/racing?in=title,content&token=[TOKEN]

Possible improvements (whether I'd have more time I can implement all of them)

- Create a test suite, even the fact we don't have to test a third party API, testing the controller might be a good point to start.
- Create a service that encapsulates the methods to consume the API, using `HTTParty` as gem and adding `rack-cors`, then we will have access to the functions
- Many other options will be available if it uses the paid version :)
- Create a beauty interface for querying the api
- Add the token not as a query param, use the headers instead
