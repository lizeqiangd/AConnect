AConnect
========

A very light Arduino connect to Flash Socket Library

In Chinese

使用方法非常容易。。
Example:

import com.lizeqiangd.aconnect.AConnect;

import com.lizeqiangd.aconnect.events.AConnectEvent;
  
private function init()

{

AConnect.init(“127.0.0.1”,54321)

AConnect.addEventListener(AConnectEvent.SOCKET_DATA, onData)

}
  
private function onData(e:AConnectEvent):void

{

trace("get data", e.data)

}

在你的Arduino项目中，每发完一句话记得加一句$end$识别。这个识别符可以在core.AConnectSetting中修改。    
    
你可以配合ajson使用，可以很容易的解决从Arduino发回的数据。不需要Air模式.
太过于简单了。只是为了以后和乐为物联关联用的库。
