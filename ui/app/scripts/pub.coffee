define (['jquery']), ($)->
  window.read = {}
  apiKey = 'd42379fde6cb9f006edee8b6c5943565'

  read.categories = (e)->
    $(e.categories.category).each ->
      snip = '<li><a class=' + @['@id'] + ' href=#list >' + @['#text'] + '</a></li>'
      $('.subnav ul').append snip


  read.listCategories = (e) ->
    $('#books .nav.nav-list').empty()
    $(e.books.book).each ->
      snip = '<li><a data-bookid=' + @['@id'] + ' href=# >' + @title['#text'] + '</a></li>'
      $('#books .nav.nav-list').append snip


  read.fetchCategories = (category) ->
    req = $.ajax
      url: 'http://api.pearson.com/ftpress/' + category + '/book.json?&apikey=' + apiKey + '&jsonp=read.listCategories'
      dataType:'jsonp'

  read.listBookBlock = (e) ->
    console.log e


  read.clickBooks = (e) ->
    $('#book-blocks .nav.nav-list').empty()
    #https://api.pearson.com/ftpress/book/{book_id}.{format}?jsonp={jsonp_callback}
    console.log e
    $.ajax
      url:'https://api.pearson.com/ftpress/book/' + e + '.json?&apikey=' + apiKey + '&jsonp=read.listBookBlock'
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
          url:'http://api.pearson.com/ftpress/' + data + '.json?apikey=' + apiKey + '&jsonp=read.' + data
          dataType: 'jsonp'
    ajaxReq('categories')

  events()# }}}


