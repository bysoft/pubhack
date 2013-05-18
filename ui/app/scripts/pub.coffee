define (['jquery']), ($)->
  window.read = {}

  read.categories = (e)->
    $(e.categories.category).each ->
      snip = '<li><a class=' + @['@id'] + ' href=#list >' + @['#text'] + '</a></li>'
      $('.subnav ul').append snip
  apiKey = 'd42379fde6cb9f006edee8b6c5943565'


  ajaxReq = (data) ->
    req = $.ajax
        url:'http://api.pearson.com/ftpress/' + data + '.json?apikey=' + apiKey + '&jsonp=read.' + data
        dataType: 'jsonp'

  ajaxReq('categories')


  read.searchCat = (e) ->
    $(e.books.book).each ->
      snip = '<li><a href=# >' + @title['#text'] + '</a></li>'
      $('.nav.nav-list').append snip
      # console.log @title['#text']


    # http://api.pearson.com/ftpress/[category]/book.[format]?title=[title text]&tag=[tag values]&author=[name]&apikey=[apikey]&jsonp=[callback name]

  read.ajaxReqCat = (category) ->
    req = $.ajax
      url: 'http://api.pearson.com/ftpress/' + category + '/book.json?&apikey=' + apiKey + '&jsonp=read.searchCat'
      dataType:'jsonp'

  read.clickEvent = ->
    $('.subnav ul').on 'click', 'a', ->
      cat = $(@).attr('class')
      read.ajaxReqCat cat
  read.clickEvent()
