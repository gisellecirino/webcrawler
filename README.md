# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby-3.0.2

* System dependencies
Rails 7.0
Mongo DB
Sidekiq
Sidekiq-Cron
Nokogiri
Fast Jsonapi
Active Model Serializers
Redis
JWT

* 1º
Rodar a task dev setup pra popular o banco a primeira vez
rails dev:setup

* 2º
Acesse via post http://localhost:3000/auths
Passe header Accept - application/vnd.api+json
No body coloque um nome para gerar um token
{
    "name": "Giselle Cirino"
}
Copie o token informado (token)

* 3º
Acesse os dados via postman
Accept - application/vnd.api+json
Authorization - Bearer token (passe o token gerado no 2º passo)

Acesse get
http://localhost:3000/quotes/search_tag

Aonde a search_tag é a tag a ser pesquisada


