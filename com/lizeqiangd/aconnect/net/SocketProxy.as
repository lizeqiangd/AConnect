package com.lizeqiangd.aconnect.net
{
	import com.lizeqiangd.aconnect.core.AConnectSetting;
	import com.lizeqiangd.aconnect.core.SocketDataBuffer;
	import com.lizeqiangd.aconnect.events.AConnectEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	
	/**
	 * ...
	 * @author Lizeqiangd
	 */
	public class SocketProxy
	{
		private var socket:Socket
		private var sdb:SocketDataBuffer
		private var _state:String = "not init"
		private var _targetIp:String = "127.0.0.1"
		private var _port:uint = 8088
		private var eventDispatch:EventDispatcher
		
		public function SocketProxy(buffer:SocketDataBuffer, _eventDispatch:EventDispatcher, targetIP:String = "127.0.0.1", port:uint = 8088)
		{
			this.socket = new Socket()
			this._targetIp = targetIP
			this._port = port
			this.sdb = buffer
			this.eventDispatch = _eventDispatch
			this.socket.addEventListener(ProgressEvent.SOCKET_DATA, onSocketData)
			this.socket.addEventListener(Event.CONNECT, onSocketConnected)
			this.socket.addEventListener(Event.CLOSE, onSocketClosed)
			this.socket.addEventListener(IOErrorEvent.IO_ERROR, onSocketIOError)
			this.socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError)
			_state = "inited"
			reconnect()
		}
		
		public function connect(TargetIp:String, Port:uint):void
		{
			this._targetIp = TargetIp
			this._port = Port
			socket.connect(TargetIp, Port)
		}
		
		public function reconnect():void
		{
			socket.connect(_targetIp, _port)
		}
		
		public function disconnect():void
		{
			if (_state != "closed")
			{
				socket.close()
				_state = "closed"
				onSocketClosed(null)
			}
		}
		
		public function sendString(e:String):void
		{
			this.socket.writeUTFBytes(e)
			this.socket.writeUTFBytes(AConnectSetting.SocketDataEndMark)
			this.socket.flush()
		}
		
		public function dispose():void
		
		{
			disconnect()
			this.socket = null
			this.socket.removeEventListener(ProgressEvent.SOCKET_DATA, onSocketData)
			this.socket.removeEventListener(Event.CONNECT, onSocketConnected)
			this.socket.removeEventListener(IOErrorEvent.IO_ERROR, onSocketIOError)
			this.socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError)
		}
		
		private function onSecurityError(e:SecurityErrorEvent):void
		{
			//trace("AConnect:SecurityError")
			_state = "SecurityError"
			eventDispatch.dispatchEvent(new AConnectEvent(AConnectEvent.SOCKET_ERROR, e.text))
			eventDispatch.dispatchEvent(new AConnectEvent(AConnectEvent.SOCKET_CLOSED))
			eventDispatch.dispatchEvent(new AConnectEvent(AConnectEvent.SOCKET_STATE, _state))
		}
		
		private function onSocketIOError(e:IOErrorEvent):void
		{
			//trace("AConnect:IOError :", e.text)
			_state = "IOError"
			eventDispatch.dispatchEvent(new AConnectEvent(AConnectEvent.SOCKET_ERROR, e.text))
			eventDispatch.dispatchEvent(new AConnectEvent(AConnectEvent.SOCKET_CLOSED))
			eventDispatch.dispatchEvent(new AConnectEvent(AConnectEvent.SOCKET_STATE, _state))
		}
		
		private function onSocketConnected(e:Event):void
		{
			//trace("AConnect:Connected.")
			_state = "connected"
			eventDispatch.dispatchEvent(new AConnectEvent(AConnectEvent.SOCKET_CONNECT))
			eventDispatch.dispatchEvent(new AConnectEvent(AConnectEvent.SOCKET_STATE, _state))
		}
		
		private function onSocketClosed(e:Event):void
		{
			_state = "closed"
			eventDispatch.dispatchEvent(new AConnectEvent(AConnectEvent.SOCKET_CLOSED))
			eventDispatch.dispatchEvent(new AConnectEvent(AConnectEvent.SOCKET_STATE, _state))
		}
		
		private function onSocketData(e:ProgressEvent):void
		{
			var temp:String = socket.readUTFBytes(socket.bytesAvailable)
			sdb.getSocketData = temp
			eventDispatch.dispatchEvent(new AConnectEvent(AConnectEvent.SOCKET_DATA, temp))
		}
		
		public function get Sockets():Socket
		{
			return this.socket
		}
		
		public function get Host():String
		{
			return _targetIp;
		}
		
		public function get Port():uint
		{
			return _port;
		}
		
		public function get State():String
		{
			return _state;
		}
	
	}

}