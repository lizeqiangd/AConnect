package com.lizeqiangd.aconnect.core
{
	import com.lizeqiangd.aconnect.AConnect;
	import com.lizeqiangd.aconnect.events.AConnectEvent;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author Lizeqiangd
	 */
	public class SocketDataBuffer
	{
		private var bufferData:String = ""
		private var _eventDispatch:EventDispatcher
		public function SocketDataBuffer(ed:EventDispatcher) {
			_eventDispatch=ed
		}
		public function set getSocketData(e:String):void
		{
			bufferData += e			
			cherkSocketDataEnd()
		}
		
		private function cherkSocketDataEnd():void
		{
			var index:int = bufferData.indexOf(AConnectSetting.SocketDataEndMark)
			//trace(index)
			if (index > 0)
			{	//trace(bufferData.slice(0, index))
				_eventDispatch.dispatchEvent(new AConnectEvent(AConnectEvent.MESSAGE,bufferData.slice(0, index)))
				bufferData = bufferData.slice(index + AConnectSetting.SocketDataEndMark.length)
				//trace(bufferData.slice(0, index))
			}
		}
	}
}