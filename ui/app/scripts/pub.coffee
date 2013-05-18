define (['jquery']), ($)->
  window.priv = {}

  priv.callback = (e)->
    $(e.categories.category).each ->
      snip = '<li><a href=/ >' + @['#text'] + '</a></li>'
      $('.subnav ul').append snip

  req = $.ajax
      url:'http://api.pearson.com/ftpress/categories.json?apikey=d42379fde6cb9f006edee8b6c5943565&jsonp=priv.callback'
      dataType: 'jsonp'


