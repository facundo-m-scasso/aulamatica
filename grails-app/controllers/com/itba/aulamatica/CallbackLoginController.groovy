package com.itba.aulamatica

import java.nio.charset.Charset;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient
import org.apache.http.message.BasicNameValuePair;

import com.itba.oauth.GoogleAuthHelper;

import groovy.json.JsonSlurper

class CallbackLoginController {

	def index() {
		String login = 'ERROR'
		String uri = '/'
		String url = "https://accounts.google.com/o/oauth2/token";
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		nameValuePairs.add(new BasicNameValuePair("grant_type", "authorization_code"));

		nameValuePairs.add(new BasicNameValuePair("client_id","149770248716-bdc3hmoi2rj9lurhh4dm20hsr2vqoene.apps.googleusercontent.com"));
		nameValuePairs.add(new BasicNameValuePair("client_secret", "pRITN9sGP2XLGxALEntEvXKT"));
		nameValuePairs.add(new BasicNameValuePair("redirect_uri", "http://localhost:8080/Aulamatica/callbackLogin"));
		nameValuePairs.add(new BasicNameValuePair("code", params.code));

		StringBuffer result = new StringBuffer();
		HttpPost post = new HttpPost(url);
		HttpClient client = new DefaultHttpClient();

		// add header
		post.setHeader("Host", "accounts.google.com");
		post.setHeader("Accept",
				"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
		post.setHeader("Accept-Language", "en-US,en;q=0.5");
		post.setHeader("Connection", "keep-alive");
		post.setHeader("Referer", "https://accounts.google.com/o/oauth2/token");
		post.setHeader("Content-Type", "application/x-www-form-urlencoded");

		post.setEntity(new UrlEncodedFormEntity(nameValuePairs));

		HttpResponse response = client.execute(post);

		int responseCode = response.getStatusLine().getStatusCode();

		BufferedReader rd = new BufferedReader(
				new InputStreamReader(response.getEntity().getContent()));


		String line = "";
		while ((line = rd.readLine()) != null) {
			result.append(line);
		}
		
		def slurper = new JsonSlurper()
		def auth = slurper.parseText(result.toString())
		
		InputStream is = new URL("https://www.googleapis.com/oauth2/v1/userinfo?access_token=" +  auth['access_token']).openStream();
		try {
		  BufferedReader reader = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
		  StringBuilder sb = new StringBuilder();
		  int cp;
		  while ((cp = reader.read()) != -1) {
			sb.append((char) cp);
		  }
		  def responseLogin = slurper.parseText(sb.toString())
		  if(responseLogin['email'].contains('itba.edu.ar')) {
			  uri = '/index'
		  }
		  else
		  {
			  login = 'ERRORDOMAIN'
		  }
		} finally {
		  is.close();
		}
		redirect(uri:uri, params:[login: login])
	}
}
