class UrlMappings {

	static mappings = {
		
		"/callbackLogin/login" (view: "/login")
		
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/login")
		"/index"(view:"/index")
		"500"(view:'/error')
	}
}
