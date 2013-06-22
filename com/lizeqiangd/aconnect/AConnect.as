package com.lizeqiangd.aconnect
{
	import com.lizeqiangd.aconnect.core.SocketDataBuffer;
	import com.lizeqiangd.aconnect.events.AConnectEvent;
	import com.lizeqiangd.aconnect.net.SocketProxy;
	import flash.events.EventDispatcher;
	import flash.net.Socket;
	
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
		
		public static function init(host:String = "127.0.0.1", port:uint = 8088):void
		{
			_eventDispatch = new EventDispatcher
			sdb = new SocketDataBuffer(_eventDispatch)
			sp = new SocketProxy(sdb, _eventDispatch, host, port)
			sp.connect(host,port)
		}
		
		//SocketProxy函数外写
		public static function connect(TargetIp:String, Port:uint):void
		{
			sp.connect(TargetIp, Port)
		}
		
		public static function reconnect():void
		{
			sp.reconnect()
		}
		
		public static function disconnect():void
		{
			sp.disconnect()
		}
		
		//向Socket发送数据
		public static function sendData(data_string:String):void
		{
			sp.sendString(data_string)
		}
		
		//事件侦听器
		public static function addEventListener(type:String, listener:Function):void
		{
			_eventDispatch.addEventListener(type, listener, false, 0, true);
		}
		
		public static function removeEventListener(type:String, listener:Function):void
		{
			_eventDispatch.removeEventListener(type, listener);
		}
		
		public static function get SocketProxys():SocketProxy
		{
			return sp
		}
		
		public static function get Sockets():Socket
		{
			return sp.Sockets
		}
	}

}