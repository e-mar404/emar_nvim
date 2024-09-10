require('tooltip').setup({
  patterns = {
    ['.js'] = 'node %s',
    ['.rb'] = 'ruby %s',
    ['.go'] = 'go run %s',
    ['.erl'] = 'escript %s',
    ['.scala'] = 'scala %s',
  },
  styled = true,
})
