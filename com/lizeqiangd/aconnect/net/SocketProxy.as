package com.lizeqiangd.aconnect.net
{
	import com.lizeqiangd.aconnect.core.SocketDataBuffer;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	
	/**
	 * ...
	 * @author Lizeqiangd
	 */
	public class SocketProxy extends Socket
	{
		private var sdb:SocketDataBuffer
		
		public function SocketProxy(_targetIP:String, _port:uint, buffer:SocketDataBuffer)
		{
			super(_targetIP, _port)
			sdb=buffer
			this.addEventListener(ProgressEvent.SOCKET_DATA, onSocketData)
			this.addEventListener(Event.CONNECT, onSocketConnected)
			this.addEventListener(IOErrorEvent.IO_ERROR, onSocketIOError)
			this.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError)
		
		}
		
		private function onSecurityError(e:SecurityErrorEvent):void
		{
			trace("AConnect:SecurityError")
		}
		
		private function onSocketIOError(e:IOErrorEvent):void
		{
			trace("AConnect:IOError :",e.text)
		}
		
		private function onSocketConnected(e:Event):void
		{
			trace("AConnect:Connected.")
		}
		
		private function onSocketData(e:ProgressEvent):void
		{
			sdb.getSocketData=(this.readUTFBytes(this.bytesAvailable))
		}
	
	}

}