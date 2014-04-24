from bottle import route, run, static_file

@route('/')
def foreveryrequest():
  return "Hello World!"

@route('/favicon.ico')
def favicon():
  return static_file('favicon.ico', root='./')

run(host='10.0.2.15', port=81, debug=True)
