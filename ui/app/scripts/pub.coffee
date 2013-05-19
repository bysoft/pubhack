define (['jquery']), ($)->
  window.read = {}
  config = {
    apiKey : 'd42379fde6cb9f006edee8b6c5943565'
    endpoint: {
      base: 'http://api.pearson.com/ftpress/'
      category:'category'
    }
    container: {
      category: '.subnav ul'
      book: '#books .nav.nav-list'
    }
  }

  read.categories = (e)->
    $(e.categories.category).each ->
      snip = '<li><a class=' + @['@id'] + ' href=#list >' + @['#text'] + '</a></li>'
      $(config.container.category).append snip


  read.listCategories = (e) ->
    $(config.container.book).empty()
    $(e.books.book).each ->
      snip = '<li><a data-bookid=' + @['@id'] + ' href=# >' + @title['#text'] + '</a></li>'
      $(config.container.book).append snip


  read.fetchCategories = (category) ->
    req = $.ajax
      url: 'http://api.pearson.com/ftpress/' + category + '/book.json?&apikey=' + config.apiKey + '&jsonp=read.listCategories'
      dataType:'jsonp'

  read.listBookBlock = (e) ->
    console.log e


  read.clickBooks = (e) ->
    $('#book-blocks .nav.nav-list').empty()
    console.log e
    $.ajax
      url:'https://api.pearson.com/ftpress/book/' + e + '.json?&apikey=' + config.apiKey + '&jsonp=read.listBookBlock'
      dataType:'jsonp'

  events = ->
    categoryClick = -># {{{
      $('.subnav ul').on 'click', 'a', ->
        cat = $(@).attr('class')
        read.fetchCategories cat
    categoryClick()

    bookClick = ->
      $('#books .nav.nav-list').on 'click', 'a', ->
        bookId = $(@).data 'bookid'
        console.log bookId
        read.clickBooks bookId
    bookClick()

    ajaxReq = (data) ->
      req = $.ajax
          url:'http://api.pearson.com/ftpress/' + data + '.json?apikey=' + config.apiKey + '&jsonp=read.' + data
          dataType: 'jsonp'
    ajaxReq('categories')

  events()# }}}


