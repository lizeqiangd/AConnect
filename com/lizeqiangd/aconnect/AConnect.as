package com.lizeqiangd.aconnect
{
	import com.lizeqiangd.aconnect.core.SocketDataBuffer;
	import com.lizeqiangd.aconnect.events.AConnectEvent;
	import com.lizeqiangd.aconnect.net.SocketProxy;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author Lizeqiangd
	 * @email lizeqiangd@gmail.com
	 * @website http://www.lizeqiangd.com
	 */
	public class AConnect
	{
		private static var _eventDispatch:EventDispatcher
		private static var sp:SocketProxy
		private static var sdb:SocketDataBuffer
		
		public static function init(host:String = "127.0.0.1", port:uint = 54321):void
		{
			_eventDispatch = new EventDispatcher
			sdb = new SocketDataBuffer(_eventDispatch)
			sp = new SocketProxy(host, port, sdb)		
		}
		
		public static function PulishData(data:String):void
		{
		
		}
		
		public static function addEventListener(type:String, listener:Function):void
		{
			_eventDispatch.addEventListener(type, listener, false, 0, true);
		}
		
		public static function removeEventListener(type:String, listener:Function):void
		{
			_eventDispatch.removeEventListener(type, listener);
		}
	}

}