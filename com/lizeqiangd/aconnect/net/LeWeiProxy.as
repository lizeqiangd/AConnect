package com.lizeqiangd.aconnect.net 
{
	
	/**
	 * ...
	 * @author Lizeqiangd
	 * @email lizeqiangd@gmail.com
	 * @website http://www.lizeqiangd.com
	 */
	public class LeWeiProxy 
	{
		public function LeWeiProxy() 
		{
			
		}
/*			protected function addProcessor(name:String, dataProcess:Function, resultEventType:String, errorEventType:String):void
		{
			if (null == serviceLoader[name])
			{
				var loader:URLLoader=new URLLoader();
				loader.addEventListener(Event.COMPLETE, loader_onComplete);
				loader.addEventListener(IOErrorEvent.IO_ERROR, loader_onError);
				loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, loader_onSecurityError);
				serviceLoader[name]=loader;
				loaderMap[loader]={dataFunc: dataProcess, resultEvent: resultEventType, errorEvent: errorEventType};
			}
		}
		public function callLeWeiAPI(uri:String, params:Object = null, method:String = "GET", resultEventType:String = "callWeiboApiResult", errorEventType:String = "callWeiboApiError"):void
		{
			addProcessor(uri, processGeneralApi, resultEventType, errorEventType);
			if (params == null) var params:Object = { };
			var baKey:String = "";
			for(var key:* in params)
			{
				if(params[key] is ByteArray)
				{
					baKey = key;
					break;
				}
			}
			if(baKey != "")
			{
				var file:ByteArray = params[key];
				delete(params[key]);
			}
			
			var req:URLRequest;
			if(_isSecureDomain){
				req = getMicroBlogRequest(API.API_BASE_URL + uri + ".json", params, method);
			}else{
				req = getMicroBlogRequest(_proxyURI + "?uri=" + uri + "&file=" + baKey + "&method=" + method, params, URLRequestMethod.POST);
			}
			if(baKey != "")
			{
				var boundary:String=makeBoundary();
				req.contentType = MULTIPART_FORMDATA + boundary;		
				req.data = makeMultipartPostData(boundary, baKey, "demo.jpg", file, req.data);
			}		
			executeRequest(uri, req);
		}
			protected function getMicroBlogRequest(url:String, params:Object = null, requestMethod:String="GET"):URLRequest
		{
			requestMethod = String(requestMethod).toUpperCase();
			var req:URLRequest;		
			if ( null == params ) params = { };		
			params.source = this._consumerKey;		
			if(access_token != "") params.access_token = access_token;
			if(requestMethod == URLRequestMethod.GET){
				url+=makeGETParamString(params);
				req = new URLRequest(url)
			}else if(requestMethod == URLRequestMethod.POST){
				req = new URLRequest(url)
				var val:URLVariables = new URLVariables();
				for (var key:* in params)
				{
					val[key] = params[key];
				}
				req.data = val;
			}	
			req.method=requestMethod;
			return req;
		}*/
	}
	
}