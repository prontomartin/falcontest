import falcon


ALLOWED_POST_TYPE = (
    'application/json',
)

def validate_post_type(req, resp, params):
    if req.content_type not in ALLOWED_POST_TYPE:
        msg = 'Input type not allowed. Must be JSON'
        raise falcon.HTTPBadRequest('Bad request', msg)


class AdduserResource(object):
	def on_get(self, req, resp):
		resp.status = falcon.HTTP_200
		resp.body = ('So you want to add a user? Try POST')

	@falcon.before(validate_post_type)
	def on_post(self, req, resp):
		ua = (req.user_agent)
		print ua
		par = (req.params)
		print par


app = falcon.API()

adduser = AdduserResource()


app.add_route('/adduser', adduser)