package com.lizeqiangd.aconnect.events
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Lizeqiangd
	 */
	
	
	public class AConnectEvent extends Event
	{
		public static const  MESSAGE:String = "message"
		public static const  SOCKET_STATE:String = "socket_state"
		public static const  SOCKET_CONNECT:String = "socket_connected"
		public static const  SOCKET_ERROR:String = "socket_error"
		public static const  SOCKET_CLOSED:String = "socket_closed"
		public static const  SOCKET_DATA:String = "socket_data"
		
		public var data:*;
		public function AConnectEvent(type:String,DispatchData:* = null,bubbles:Boolean = false)
		{
			super(type, bubbles, cancelable);
			data = DispatchData;
		}
		
		public override function clone():Event
		{
			return new AConnectEvent(type, bubbles, cancelable);
		}
		
		public override function toString():String
		{
			return formatToString("AConnectEvent", "type", "bubbles", "cancelable", "eventPhase");
		}
	
	}

}